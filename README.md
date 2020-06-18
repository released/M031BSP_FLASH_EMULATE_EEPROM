# M031BSP_FLASH_EMULATE_EEPROM
 M031BSP_FLASH_EMULATE_EEPROM


update @ 2020/06/18

1. Use internal flash to emulate EEPROM

- with 2 pages (for backup each other) , refer to DATA_FLASH_PAGE define

- and expected EEPROM adddress total : 36 bytes , refer to DATA_FLASH_AMOUNT

- data flash address set to 0x7C00 , refer to DATA_FLASH_OFFSET

- Under Emulate_EEPROM_Process , write data in order and read back according to address and send UART string

- below is EEPROM write and read data log for reference 

![image](https://github.com/released/M031BSP_FLASH_EMULATE_EEPROM/blob/master/log.jpg)

![image](https://github.com/released/M031BSP_FLASH_EMULATE_EEPROM/blob/master/KEIL_memory1_memory2_0x7C00.jpg)
