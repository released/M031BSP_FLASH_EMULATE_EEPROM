################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/acmp.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/adc.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/clk.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/crc.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/ebi.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/fmc.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/gpio.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/i2c.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/pdma.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/pwm.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/retarget.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/spi.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/sys.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/timer.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/uart.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/usbd.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/usci_i2c.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/usci_spi.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/usci_uart.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/wdt.c \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/wwdt.c 

OBJS += \
./Library/acmp.o \
./Library/adc.o \
./Library/clk.o \
./Library/crc.o \
./Library/ebi.o \
./Library/fmc.o \
./Library/gpio.o \
./Library/i2c.o \
./Library/pdma.o \
./Library/pwm.o \
./Library/retarget.o \
./Library/spi.o \
./Library/sys.o \
./Library/timer.o \
./Library/uart.o \
./Library/usbd.o \
./Library/usci_i2c.o \
./Library/usci_spi.o \
./Library/usci_uart.o \
./Library/wdt.o \
./Library/wwdt.o 

C_DEPS += \
./Library/acmp.d \
./Library/adc.d \
./Library/clk.d \
./Library/crc.d \
./Library/ebi.d \
./Library/fmc.d \
./Library/gpio.d \
./Library/i2c.d \
./Library/pdma.d \
./Library/pwm.d \
./Library/retarget.d \
./Library/spi.d \
./Library/sys.d \
./Library/timer.d \
./Library/uart.d \
./Library/usbd.d \
./Library/usci_i2c.d \
./Library/usci_spi.d \
./Library/usci_uart.d \
./Library/wdt.d \
./Library/wwdt.d 


# Each subdirectory must supply rules for building sources it contributes
Library/acmp.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/acmp.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/adc.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/adc.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/clk.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/clk.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/crc.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/crc.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/ebi.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/ebi.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/fmc.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/fmc.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/gpio.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/i2c.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/i2c.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/pdma.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/pdma.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/pwm.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/pwm.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/retarget.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/retarget.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/spi.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/sys.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/sys.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/timer.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/timer.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/uart.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/uart.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/usbd.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/usbd.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/usci_i2c.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/usci_i2c.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/usci_spi.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/usci_spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/usci_uart.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/usci_uart.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/wdt.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/wdt.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Library/wwdt.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/StdDriver/src/wwdt.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


