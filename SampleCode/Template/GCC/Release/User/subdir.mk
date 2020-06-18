################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/main.c 

OBJS += \
./User/main.o 

C_DEPS += \
./User/main.d 


# Each subdirectory must supply rules for building sources it contributes
User/main.o: D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/CMSIS/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/Device/Nuvoton/M031/Include" -I"D:/SourceCode/_Avery_M031/M031BSP_ADC_ModifiedMovingAverage/SampleCode/Template/GCC/../../../Library/StdDriver/inc" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


