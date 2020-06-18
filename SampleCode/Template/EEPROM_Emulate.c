/**************************************************************************//**
 * @file     EEPROM_Emulate.c
 * @brief    Emulate Data Flash as EEPROM
 * Copyright (C) 2015 Nuvoton Technology Corp. All rights reserved.
 ******************************************************************************/
#include "EEPROM_Emulate.h"

/*---------------------------------------------------------------------------------------------------------*/
/* Variables                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
uint32_t	Amount_Pages;
uint32_t	Amount_of_Data;
uint32_t	Current_Valid_Page = 0;
uint32_t	Current_Cursor;
uint8_t		*Written_Data;

/**
  * @brief     Enable FMC ISP function.
  */
void FMC_Enable(void)
{
		/* Unlock protected registers for ISP function */
		SYS_UnlockReg();
    
//		CLK->AHBCLK |= CLK_AHBCLK_ISP_EN_Msk;
//		/* Enable ISP function */
//		FMC->ISPCON |= FMC_ISPCON_ISPEN_Msk;

		CLK->AHBCLK |= CLK_AHBCLK_ISPCKEN_Msk;
		/* Enable ISP function */
		FMC->ISPCTL |= FMC_ISPCTL_ISPEN_Msk;

}

/**
  * @brief    	Initial Data Flash as EEPROM.
	* @param[in]  data_size: The amount of user's data, unit in byte. The maximun amount is 128.
  * @param[in]	use_pages: The amount of page which user want to use.
  * @retval			Err_OverPageSize: The amount of user's data is over than the maximun amount.
  * @retval			Err_OverPageAmount: The amount of page which user want to use is over than the maximun amount.
	* @retval			0: Success
  */
uint32_t Init_EEPROM(uint32_t data_amount, uint32_t use_pages)
{
		uint32_t i;
	
		/* The amount of data includes 1 byte address and 1 byte data */
		Amount_of_Data = data_amount;
		/* The amount of page which user want to use */
		Amount_Pages = use_pages;

		/* Check setting is valid or not */
		/* The amount of user's data is more than the maximun amount or not */
		if(Amount_of_Data > Max_Amount_of_Data)
				return	Err_OverAmountData;
		/* For M051 Series, the max. amount of Data Flash pages is 8 */
		if(Amount_Pages > 8)
				return	Err_OverPageAmount;		

		/* Init SRAM for data */
		Written_Data = (uint8_t *)malloc(sizeof(uint8_t) * Amount_of_Data);
		/* Fill initial data 0xFF*/
		for(i = 0; i < Amount_of_Data; i++)
		{
				Written_Data[i] = 0xFF;
		}
		
		return 0;
}

/**
  * @brief     Search which page has valid data and where is current cursor for the next data to write.
  */
void Search_Valid_Page(void)
{
		uint32_t i, temp;
		uint8_t	addr, data;
		uint16_t	*Page_Status_ptr;

		/* Enable FMC ISP function */
		FMC_Enable();
	
		/* Set information of each pages to Page_Status */
		Page_Status_ptr = (uint16_t *)malloc(sizeof(uint16_t) * Amount_Pages);
		for(i = 0; i < Amount_Pages; i++)
		{
				Page_Status_ptr[i] = (uint16_t)FMC_Read(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * i));
		}
	
		/* Search which page has valid data */
		for(i = 0; i < Amount_Pages; i++)
		{
				if(Page_Status_ptr[i] != Status_Unwritten)
						Current_Valid_Page = i;
		}
		/* If Data Flash is used for first time, set counter = 0 */
		if(Page_Status_ptr[Current_Valid_Page] == Status_Unwritten)
		{
				/* Set counter = 0 */
				FMC_Write(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * Current_Valid_Page), 0xFFFF0000);
				/* Set cursor to current Data Flash address */
				Current_Cursor = 2;
		}
		else
		{
				/* Search where is current cursor for the next data to write and get the data has been written */
				/* Check even value */
				temp = FMC_Read(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * Current_Valid_Page));
				addr = (temp & Even_Addr_Mask) >> Even_Addr_Pos;
				data = (temp & Even_Data_Mask) >> Even_Data_Pos;
				/* Check Address is 0xFF (un-written) of not */
				if(addr == 0xFF)
				{
						/* If Address is 0xFF, then set cursor to current Data Flash address */
						Current_Cursor = 2;
				}
				else
				{
						/* Copy the address and data to SRAM */
						Written_Data[addr] = data;
					
						/* Check the whole Data Flash */
						for(i = 4; i < FMC_FLASH_PAGE_SIZE; i += 4)
						{
								/* Check odd value */
								temp = FMC_Read(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * Current_Valid_Page) + i);
								addr = (temp & Odd_Addr_Mask) >> Odd_Addr_Pos;
								data = (temp & Odd_Data_Mask) >> Odd_Data_Pos;
								/* Check Address is 0xFF (un-written) of not */
								if(addr == 0xFF)
								{
										/* If Address is 0xFF, then set cursor to current Data Flash address */
										Current_Cursor = i;
										break;
								}
								else
								{
										/* Copy the address and data to SRAM */
										Written_Data[addr] = data;
								}
								
								/* Check even value */
								addr = (temp & Even_Addr_Mask) >> Even_Addr_Pos;
								data = (temp & Even_Data_Mask) >> Even_Data_Pos;
								/* Check Address is 0xFF (un-written) of not */
								if(addr == 0xFF)
								{
										/* If Address is 0xFF, then set cursor to current Data Flash address */
										Current_Cursor = i + 2;
										break;
								}
								else
								{
										/* Copy the address and data to SRAM */
										Written_Data[addr] = data;
								}
						}
				}
		}
}

/**
  * @brief      Read one byte data from SRAM.
	* @param[in]  index: The index of data address.
  * @param[in]	data: The data in the index of data address from SRAM.
  * @retval			Err_ErrorIndex: The input index is now valid.
	* @retval			0: Success
  */
uint32_t Read_Data(uint8_t index, uint8_t *data)
{
	
		/* Check the index is valid or not */
		if(index >= Max_Amount_of_Data)
		{
				return Err_ErrorIndex;
		}
		
		/* Get the data from SRAM */
		*data = Written_Data[index];
		
		return 0;
}

/**
  * @brief     Write one byte data to SRAM and current valid page.
							 If this index has the same data, it will not changed in SRAM and Data Flash.
							 If current valid page is full, execute Manage_Next_Page() to copy valid data to next page.
	* @param[in]  index: The index of data address.
  * @param[in]	data: The data that will be writeen.
  * @retval			Err_ErrorIndex: The input index is not valid.
	* @retval			0: Success
  */
uint32_t Write_Data(uint8_t index, uint8_t data)
{
		uint32_t temp = 0;

		/* Check the index is valid or not */
		if(index > Amount_of_Data)
		{
				return Err_ErrorIndex;
		}
		/* If the writing data equals to current data, the skip the write process */
		if(Written_Data[index] == data)
		{
				return 0;
		}
	
		/* Enable FMC ISP function */
		FMC_Enable();
	
		/* Current cursor points to odd position*/
		if((Current_Cursor & 0x3) == 0)
		{
				/* Write data to Data Flash */
				temp = 0xFFFF0000 | (index << Odd_Addr_Pos) | (data << Odd_Data_Pos);
				FMC_Write(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * Current_Valid_Page) + Current_Cursor, temp);
				/* Write data to SRAM */
				Written_Data[index] = data;
		}
		/* Current cursor points to even position*/
		else
		{
				/* Read the odd position data */
				temp = FMC_Read(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * Current_Valid_Page) + (Current_Cursor - 2));
				/* Combine odd position data and even position data */
				temp &= ~(Even_Addr_Mask | Even_Data_Mask);
				temp |= (index << Even_Addr_Pos) | (data << Even_Data_Pos);
				/* Write data to Data Flash */
				FMC_Write(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * Current_Valid_Page) + (Current_Cursor - 2), temp);
				/* Write data to SRAM */
				Written_Data[index] = data;
		}
		
		/* If current cursor points to the last position, then execute Manage_Next_Page() */
		if(Current_Cursor == (FMC_FLASH_PAGE_SIZE - 2))
		{
				/* Copy valid data to next page */
				Manage_Next_Page();
		}
		/* Add current cursor */
		else
		{
				/* Set current cursor to next position */
				Current_Cursor += 2;
		}
		
		return 0;
}

/**
  * @brief     Manage the valid data from SRAM to new page.
  */
void Manage_Next_Page(void)
{
		uint32_t i = 0, j, counter, temp = 0, data_flag = 0, new_page;

		/* Copy the valid data (not 0xFF) from SRAM to new valid page */
		/* Get counter from the first two bytes */
		counter = FMC_Read(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * Current_Valid_Page));

		/* If current valid page is the last page, choose the first page as valid page */
		if((Current_Valid_Page + 1) == Amount_Pages)
		{
				new_page = 0;
				/* Add counter to record 1 E/W cycle finished for all pages */
				counter++;
		}
		else
		{
				new_page = Current_Valid_Page + 1;
		}
	
		/* Enable FMC ISP function */
		FMC_Enable();
				
		/* Copy first valid data */
		while(1)
		{
				/* Not a valid data, skip */
				if(Written_Data[i] == 0xFF)
				{
						i++;
				}
				/* Combine counter and first valid data, and write to new page */
				else
				{
						counter &= ~(Even_Addr_Mask | Even_Data_Mask);
						counter |= (i << Even_Addr_Pos) | (Written_Data[i] << Even_Data_Pos);
						FMC_Write(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * new_page), counter);
						i++;
						break;
				}
		}
		/* Copy the rest of data */
		for(j = 4; i < Amount_of_Data; i++)
		{
				/* Not a valid data, skip */
				if(Written_Data[i] == 0xFF)
				{
						continue;
				}
				/* Write to new page */
				else
				{
						/* Collect two valid data and write to Data Flash */
						/* First data, won't write to Data Flash immediately */
						if(data_flag == 0)
						{
								temp |= (i << Odd_Addr_Pos) | (Written_Data[i] << Odd_Data_Pos);
								data_flag = 1;
						}
						/* Second data, write to Data Flash after combine with first data */
						else
						{
								temp |= (i << Even_Addr_Pos) | (Written_Data[i] << Even_Data_Pos);
								FMC_Write(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * new_page) + j, temp);
								temp = 0;
								data_flag = 0;
								j += 4;
						}
				}				
		}
		
		/* Set cursor to new page */
		Current_Cursor = j;
		
		/* If there is one valid data left, write to Data Flash */
		if(data_flag == 1)
		{
				temp |= 0xFFFF0000;
				FMC_Write(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * new_page) + j, temp);				
				Current_Cursor += 2;
		}
		
		/* Erase the old page */
		FMC_Erase(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * Current_Valid_Page));
		/* Point to new valid page */
		Current_Valid_Page = new_page;
}

/**
  * @brief      Get the cycle counter for how many cycles has page been erased/programmed.
  * @retval			Cycle_Conter: The cycles that page has been erased/programmed.
  */
uint16_t Get_Cycle_Counter(void)
{
		uint16_t Cycle_Counter;
	
		/* Get the cycle counter from first two bytes in current Data Flash page */
		Cycle_Counter = (uint16_t)FMC_Read(DataFlash_BaseAddr + (FMC_FLASH_PAGE_SIZE * Current_Valid_Page));
	
		return Cycle_Counter;
}
