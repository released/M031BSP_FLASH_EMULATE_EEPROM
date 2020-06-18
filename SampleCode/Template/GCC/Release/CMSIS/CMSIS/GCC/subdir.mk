################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/Device/Nuvoton/M031/Source/GCC/_syscalls.c 

S_UPPER_SRCS += \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/Device/Nuvoton/M031/Source/GCC/startup_M031Series.S 

OBJS += \
./CMSIS/CMSIS/GCC/_syscalls.o \
./CMSIS/CMSIS/GCC/startup_M031Series.o 

S_UPPER_DEPS += \
./CMSIS/CMSIS/GCC/startup_M031Series.d 

C_DEPS += \
./CMSIS/CMSIS/GCC/_syscalls.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS/CMSIS/GCC/_syscalls.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/Device/Nuvoton/M031/Source/GCC/_syscalls.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

CMSIS/CMSIS/GCC/startup_M031Series.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/Library/Device/Nuvoton/M031/Source/GCC/startup_M031Series.S
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


