/******************************************************************************
 * @file     main.c
 * @version  V1.00
 * @brief    A project template for M031 MCU.
 *
 * Copyright (C) 2017 Nuvoton Technology Corp. All rights reserved.
*****************************************************************************/
#include <stdio.h>
#include <string.h>

#include "NuMicro.h"
#include "EEPROM_Emulate.h"

#define FIFO_THRESHOLD 							(4)
#define RX_BUFFER_SIZE 							(128)
#define RX_TIMEOUT_CNT 							(20)

#define MASTER_DATA_NUM						(16)

#define DATA_FLASH_OFFSET  						(0x7C00)

#define DATA_FLASH_AMOUNT						(48)
#define DATA_FLASH_PAGE  						(2)

typedef enum
{
    eUART_RX_Received_Data_Finish = 0,
    eUART_RX_Received_Data_NOT_Finish
}eUART_RX_State_Index;

typedef enum{
	flag_UART_TX_Finish = 0 ,	
	flag_UART_RX_Finish , 	
	flag_Record_Data ,
	flag_Write_Data ,


	flag_DEFAULT	
}Flag_Index;


//UART
volatile uint8_t g_au8UART_RX_Buffer[RX_BUFFER_SIZE] = {0}; // UART Rx received data Buffer (RAM)
volatile eUART_RX_State_Index g_bUART_RX_Received_Data_State = eUART_RX_Received_Data_NOT_Finish;
volatile uint8_t g_u8UART_RDA_Trigger_Cnt = 0; // UART RDA interrupt trigger times counter
volatile uint8_t g_u8UART_RXTO_Trigger_Cnt = 0; // UART RXTO interrupt trigger times counter

uint32_t BitFlag = 0;
#define BitFlag_ON(flag)							(BitFlag|=flag)
#define BitFlag_OFF(flag)							(BitFlag&=~flag)
#define BitFlag_READ(flag)							((BitFlag&flag)?1:0)
#define ReadBit(bit)								(uint8_t)(1<<bit)

#define is_flag_set(idx)							(BitFlag_READ(ReadBit(idx)))
#define set_flag(idx,en)							( (en == 1) ? (BitFlag_ON(ReadBit(idx))) : (BitFlag_OFF(ReadBit(idx))))


int IsDebugFifoEmpty(void);

eUART_RX_State_Index is_UART_RX_Finish(void)
{
	return g_bUART_RX_Received_Data_State;
}

void set_UART_RX_Finish(eUART_RX_State_Index en)
{
	g_bUART_RX_Received_Data_State = en;
}

int set_data_flash_base(uint32_t u32DFBA)
{
    uint32_t   au32Config[2];
	
    /* Read User Configuration 0 & 1 */
    if (FMC_ReadConfig(au32Config, 2) < 0)
    {
        printf("\nRead User Config failed!\n");
        return -1;
    }

    /* Check if Data Flash is enabled (CONFIG0[0]) and is expected address (CONFIG1) */
    if ((!(au32Config[0] & 0x1)) && (au32Config[1] == u32DFBA))
        return 0;

    FMC_ENABLE_CFG_UPDATE();

    au32Config[0] &= ~0x1;         /* CONFIG0[0] = 0 (Enabled) / 1 (Disabled) */
    au32Config[1] = u32DFBA;

    /* Update User Configuration settings. */
    if (FMC_WriteConfig(au32Config, 2) < 0)
        return -1;

    FMC_ReadConfig(au32Config, 2);

    /* Check if Data Flash is enabled (CONFIG0[0]) and is expected address (CONFIG1) */
    if (((au32Config[0] & 0x01) == 1) || (au32Config[1] != u32DFBA))
    {
        printf("Error: Program Config Failed!\n");
        /* Disable FMC ISP function */
        FMC_Close();
        SYS_LockReg();
        return -1;
    }


    printf("\nSet Data Flash base as 0x%x.\n", u32DFBA);

    /* To check if all the debug messages are finished */
    while(!IsDebugFifoEmpty());

    /* Perform chip reset to make new User Config take effect */
    SYS->IPRST0 = SYS_IPRST0_CHIPRST_Msk;
    return 0;
}


void GPIO_Init (void)
{
    GPIO_SetMode(PB, BIT14, GPIO_MODE_OUTPUT);
}

void Emulate_EEPROM_WriteTest(void)
{
	uint8_t cnt = 0;
	uint8_t i = 0;
	static uint8_t incr_base = 0;
	
	for (i = 0 ; i < DATA_FLASH_AMOUNT; i ++)
	{
		Write_Data(i%DATA_FLASH_AMOUNT, incr_base + (cnt++) );
	}

	incr_base++;	//incr_base += 0x10;

	/* Disable FMC ISP function */
	FMC_Close();

	/* Lock protected registers */
	SYS_LockReg();
}

void Emulate_EEPROM_ReadTest(void)
{
	uint8_t i = 0;
	uint8_t cnt = 0;

	for (i = 0 ; i < DATA_FLASH_AMOUNT; i ++)
	{
		Read_Data(i%DATA_FLASH_AMOUNT, &cnt );
		printf("0x%2X , ", cnt);
		if ((i+1)%8 ==0)
		{
			printf("\r\n");
		}
	}
}

void Emulate_EEPROM_Process(void)
{
	uint8_t string[] = "\r\nEmulate_EEPROM_Process finish !\r\n\r\n" ; 

	if (is_flag_set(flag_Record_Data))
	{
		set_flag(flag_Record_Data , DISABLE);

		Emulate_EEPROM_ReadTest();
		
		UART_Write(UART0 , string , strlen((char*)string) );
	}

	if (is_flag_set(flag_Write_Data))
	{
		set_flag(flag_Write_Data , DISABLE);

		Emulate_EEPROM_WriteTest();
	}

	
}

void Emulate_EEPROM(void)
{
    SYS_UnlockReg();

    /* Enable FMC ISP function */
    FMC_Open();

    if (set_data_flash_base(DATA_FLASH_OFFSET) < 0)
    {
        printf("Failed to set Data Flash base address!\r\n");
    }

	/* Test Init_EEPROM() */
	Init_EEPROM(DATA_FLASH_AMOUNT, DATA_FLASH_PAGE);
	Search_Valid_Page();	
}

void UART_Loop_Process(void)
{

	if (is_flag_set(flag_UART_RX_Finish))
	{
//		/* Wait to receive UART data */
//		while(UART_RX_IDLE(UART0));

//		/* Start to received UART data */
//		set_UART_RX_Finish(eUART_RX_Received_Data_NOT_Finish);     
//		/* Wait for receiving UART message finished */
//		while(is_UART_RX_Finish() != eUART_RX_Received_Data_Finish); 

		set_flag(flag_UART_RX_Finish , DISABLE);

		printf("\nUART0 Rx Received Data : %s\n",g_au8UART_RX_Buffer);
		printf("UART0 Rx RDA (Fifofull) interrupt times : %d\n",g_u8UART_RDA_Trigger_Cnt);
		printf("UART0 Rx RXTO (Timeout) interrupt times : %d\n",g_u8UART_RXTO_Trigger_Cnt);

		/* Reset UART interrupt parameter */
		UART_EnableInt(UART0, UART_INTEN_RDAIEN_Msk | UART_INTEN_RXTOIEN_Msk);
		g_u8UART_RDA_Trigger_Cnt = 0; // UART RDA interrupt times
		g_u8UART_RXTO_Trigger_Cnt = 0; // UART RXTO interrupt times

	}
}

void UART02_IRQHandler(void)
{
    uint8_t i;
    static uint16_t u16UART_RX_Buffer_Index = 0;

	if ((UART_GET_INT_FLAG(UART0,UART_INTSTS_RDAINT_Msk)))
	{
        /* UART receive data available flag */
        
        /* Record RDA interrupt trigger times */
        g_u8UART_RDA_Trigger_Cnt++;
        
        /* Move the data from Rx FIFO to sw buffer (RAM). */
        /* Every time leave 1 byte data in FIFO for Rx timeout */
        for(i = 0 ; i < (FIFO_THRESHOLD - 1) ; i++)
        {
            g_au8UART_RX_Buffer[u16UART_RX_Buffer_Index] = UART_READ(UART0);
            u16UART_RX_Buffer_Index ++;

            if (u16UART_RX_Buffer_Index >= RX_BUFFER_SIZE) 
                u16UART_RX_Buffer_Index = 0;
        }	
	}
    else if(UART_GET_INT_FLAG(UART0, UART_INTSTS_RXTOINT_Msk)) 
    {
        /* When Rx timeout flag is set to 1, it means there is no data needs to be transmitted. */

        /* Record Timeout times */
        g_u8UART_RXTO_Trigger_Cnt++;

        /* Move the last data from Rx FIFO to sw buffer. */
        while(UART_GET_RX_EMPTY(UART0) == 0)
        {
            g_au8UART_RX_Buffer[u16UART_RX_Buffer_Index] = UART_READ(UART0);
            u16UART_RX_Buffer_Index ++;
        }

        /* Clear UART RX parameter */
        UART_DISABLE_INT(UART0, UART_INTEN_RDAIEN_Msk | UART_INTEN_RXTOIEN_Msk);
        u16UART_RX_Buffer_Index = 0;
		set_UART_RX_Finish(eUART_RX_Received_Data_Finish);

		set_flag(flag_UART_RX_Finish,ENABLE);

    }
	
}

void UART0_HW_Init(void)
{
    /* Enable UART0 clock */	
    CLK_EnableModuleClock(UART0_MODULE);

    /* Switch UART0 clock source */	
    CLK_SetModuleClock(UART0_MODULE, CLK_CLKSEL1_UART0SEL_PCLK0, CLK_CLKDIV0_UART0(1));

    /* Set PB multi-function pins for UART0 RXD=PB.12 and TXD=PB.13 */
    SYS->GPB_MFPH = (SYS->GPB_MFPH & ~(SYS_GPB_MFPH_PB12MFP_Msk | SYS_GPB_MFPH_PB13MFP_Msk))    |       \
                    (SYS_GPB_MFPH_PB12MFP_UART0_RXD | SYS_GPB_MFPH_PB13MFP_UART0_TXD);	
}

void UART0_Init(void)
{
    SYS_ResetModule(UART0_RST);

    /* Configure UART0 and set UART0 baud rate */
    UART_Open(UART0, 115200);

	/* Set UART receive time-out */
	UART_SetTimeoutCnt(UART0, RX_TIMEOUT_CNT);

	/* Set UART FIFO RX interrupt trigger level to 4-bytes*/
    UART0->FIFO = ((UART0->FIFO & (~UART_FIFO_RFITL_Msk)) | UART_FIFO_RFITL_4BYTES);

	/* Enable UART Interrupt - */
	UART_ENABLE_INT(UART0, UART_INTEN_RDAIEN_Msk | UART_INTEN_RXTOIEN_Msk);
	
	NVIC_EnableIRQ(UART02_IRQn);	

	printf("\r\nCLK_GetCPUFreq : %8d\r\n",CLK_GetCPUFreq());
	printf("CLK_GetHXTFreq : %8d\r\n",CLK_GetHXTFreq());
	printf("CLK_GetLXTFreq : %8d\r\n",CLK_GetLXTFreq());	
	printf("CLK_GetPCLK0Freq : %8d\r\n",CLK_GetPCLK0Freq());
	printf("CLK_GetPCLK1Freq : %8d\r\n",CLK_GetPCLK1Freq());


	UART_WAIT_TX_EMPTY(UART0);
}

void TMR1_IRQHandler(void)
{
//	static uint32_t LOG = 0;
	static uint16_t CNT_read = 0;
	static uint16_t CNT_write = 0;

	
    if(TIMER_GetIntFlag(TIMER1) == 1)
    {
        TIMER_ClearIntFlag(TIMER1);

		if (CNT_read++ >= 1)
		{		
			CNT_read = 0;
//        	printf("%s : %4d\r\n",__FUNCTION__,LOG++);
			PB14 ^= 1;	
			set_flag(flag_Record_Data , ENABLE);
		}

		if (CNT_write++ >= 1)
		{		
			CNT_write = 0;
			set_flag(flag_Write_Data , ENABLE);
		}	
    }
}

void TIMER1_Init(void)
{
    TIMER_Open(TIMER1, TIMER_PERIODIC_MODE, 1000);
    TIMER_EnableInt(TIMER1);
    NVIC_EnableIRQ(TMR1_IRQn);	
    TIMER_Start(TIMER1);
}

void SYS_Init(void)
{
    /* Unlock protected registers */
    SYS_UnlockReg();

    /* Enable HIRC clock (Internal RC 48MHz) */
    CLK_EnableXtalRC(CLK_PWRCTL_HIRCEN_Msk);
//    CLK_EnableXtalRC(CLK_PWRCTL_HXTEN_Msk);
	
    /* Wait for HIRC clock ready */
    CLK_WaitClockReady(CLK_STATUS_HIRCSTB_Msk);
//    CLK_WaitClockReady(CLK_STATUS_HXTSTB_Msk);
	
    /* Select HCLK clock source as HIRC and HCLK source divider as 1 */
    CLK_SetHCLK(CLK_CLKSEL0_HCLKSEL_HIRC, CLK_CLKDIV0_HCLK(1));

	UART0_HW_Init();
	
    CLK_EnableModuleClock(TMR1_MODULE);
    CLK_SetModuleClock(TMR1_MODULE, CLK_CLKSEL1_TMR1SEL_PCLK0, 0);
	
    /* Update System Core Clock */
    SystemCoreClockUpdate();

    /* Lock protected registers */
    SYS_LockReg();
}

/*
 * This is a template project for M031 series MCU. Users could based on this project to create their
 * own application without worry about the IAR/Keil project settings.
 *
 * This template application uses external crystal as HCLK source and configures UART0 to print out
 * "Hello World", users may need to do extra system configuration based on their system design.
 */

int main()
{
    SYS_Init();

    UART0_Init();

	Emulate_EEPROM();

	GPIO_Init();

	TIMER1_Init();
	
    /* Got no where to go, just loop forever */
    while(1)
    {
		UART_Loop_Process();

		Emulate_EEPROM_Process();
    }
}

/*** (C) COPYRIGHT 2017 Nuvoton Technology Corp. ***/
