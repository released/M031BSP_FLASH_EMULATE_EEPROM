################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/EEPROM_Emulate.c \
D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/main.c 

OBJS += \
./User/EEPROM_Emulate.o \
./User/main.o 

C_DEPS += \
./User/EEPROM_Emulate.d \
./User/main.d 


# Each subdirectory must supply rules for building sources it contributes
User/EEPROM_Emulate.o: D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/EEPROM_Emulate.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -I"D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/GCC/.." -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

User/main.o: D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -I"D:/SourceCode/_Avery_M031/M031BSP_FLASH_EMULATE_EEPROM/SampleCode/Template/GCC/.." -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


