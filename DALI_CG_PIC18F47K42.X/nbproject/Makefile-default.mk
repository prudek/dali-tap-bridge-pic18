#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/DALI_CG_PIC18F47K42.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/DALI_CG_PIC18F47K42.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../dali_library/dali_core/dali_hal/dali_cg_frameHandler_K42.c mcc_generated_files/clc1.c mcc_generated_files/clc4.c mcc_generated_files/spi1.c mcc_generated_files/interrupt_manager.c mcc_generated_files/clc3.c mcc_generated_files/tmr4.c mcc_generated_files/tmr2.c mcc_generated_files/uart1.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr6.c mcc_generated_files/pwm5.c mcc_generated_files/mcc.c mcc_generated_files/adcc.c mcc_generated_files/memory.c ../dali_library/debug_console.c ../dali_library/debug_uart2.c ../dali_library/dali_diag.c ../dali_library/dali_diag_terminal.c ../dali_library/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1 ${OBJECTDIR}/mcc_generated_files/clc1.p1 ${OBJECTDIR}/mcc_generated_files/clc4.p1 ${OBJECTDIR}/mcc_generated_files/spi1.p1 ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1 ${OBJECTDIR}/mcc_generated_files/clc3.p1 ${OBJECTDIR}/mcc_generated_files/tmr4.p1 ${OBJECTDIR}/mcc_generated_files/tmr2.p1 ${OBJECTDIR}/mcc_generated_files/uart1.p1 ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 ${OBJECTDIR}/mcc_generated_files/tmr6.p1 ${OBJECTDIR}/mcc_generated_files/pwm5.p1 ${OBJECTDIR}/mcc_generated_files/mcc.p1 ${OBJECTDIR}/mcc_generated_files/adcc.p1 ${OBJECTDIR}/mcc_generated_files/memory.p1 ${OBJECTDIR}/_ext/1726407717/debug_console.p1 ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1 ${OBJECTDIR}/_ext/1726407717/dali_diag.p1 ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1 ${OBJECTDIR}/_ext/1726407717/main.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1.d ${OBJECTDIR}/mcc_generated_files/clc1.p1.d ${OBJECTDIR}/mcc_generated_files/clc4.p1.d ${OBJECTDIR}/mcc_generated_files/spi1.p1.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d ${OBJECTDIR}/mcc_generated_files/clc3.p1.d ${OBJECTDIR}/mcc_generated_files/tmr4.p1.d ${OBJECTDIR}/mcc_generated_files/tmr2.p1.d ${OBJECTDIR}/mcc_generated_files/uart1.p1.d ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d ${OBJECTDIR}/mcc_generated_files/tmr6.p1.d ${OBJECTDIR}/mcc_generated_files/pwm5.p1.d ${OBJECTDIR}/mcc_generated_files/mcc.p1.d ${OBJECTDIR}/mcc_generated_files/adcc.p1.d ${OBJECTDIR}/mcc_generated_files/memory.p1.d ${OBJECTDIR}/_ext/1726407717/debug_console.p1.d ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1.d ${OBJECTDIR}/_ext/1726407717/dali_diag.p1.d ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1.d ${OBJECTDIR}/_ext/1726407717/main.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1 ${OBJECTDIR}/mcc_generated_files/clc1.p1 ${OBJECTDIR}/mcc_generated_files/clc4.p1 ${OBJECTDIR}/mcc_generated_files/spi1.p1 ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1 ${OBJECTDIR}/mcc_generated_files/clc3.p1 ${OBJECTDIR}/mcc_generated_files/tmr4.p1 ${OBJECTDIR}/mcc_generated_files/tmr2.p1 ${OBJECTDIR}/mcc_generated_files/uart1.p1 ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 ${OBJECTDIR}/mcc_generated_files/tmr6.p1 ${OBJECTDIR}/mcc_generated_files/pwm5.p1 ${OBJECTDIR}/mcc_generated_files/mcc.p1 ${OBJECTDIR}/mcc_generated_files/adcc.p1 ${OBJECTDIR}/mcc_generated_files/memory.p1 ${OBJECTDIR}/_ext/1726407717/debug_console.p1 ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1 ${OBJECTDIR}/_ext/1726407717/dali_diag.p1 ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1 ${OBJECTDIR}/_ext/1726407717/main.p1

# Source Files
SOURCEFILES=../dali_library/dali_core/dali_hal/dali_cg_frameHandler_K42.c mcc_generated_files/clc1.c mcc_generated_files/clc4.c mcc_generated_files/spi1.c mcc_generated_files/interrupt_manager.c mcc_generated_files/clc3.c mcc_generated_files/tmr4.c mcc_generated_files/tmr2.c mcc_generated_files/uart1.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr6.c mcc_generated_files/pwm5.c mcc_generated_files/mcc.c mcc_generated_files/adcc.c mcc_generated_files/memory.c ../dali_library/debug_console.c ../dali_library/debug_uart2.c ../dali_library/dali_diag.c ../dali_library/dali_diag_terminal.c ../dali_library/main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/DALI_CG_PIC18F47K42.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F47K42
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/275292492/random.p1: ../drivers_peripherals/random.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/275292492" 
	@${RM} ${OBJECTDIR}/_ext/275292492/random.p1.d 
	@${RM} ${OBJECTDIR}/_ext/275292492/random.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/275292492/random.p1 ../drivers_peripherals/random.c 
	@-${MV} ${OBJECTDIR}/_ext/275292492/random.d ${OBJECTDIR}/_ext/275292492/random.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/275292492/random.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1: ../lamp_hardware/lamp_hw_dev_type_6/lamp_hardware_dev_type_6.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/856521997" 
	@${RM} ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1.d 
	@${RM} ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1 ../lamp_hardware/lamp_hw_dev_type_6/lamp_hardware_dev_type_6.c 
	@-${MV} ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.d ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1: ../lamp_hardware/lamp_hw_dev_type_6/lamp_reference_system_power.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/856521997" 
	@${RM} ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1.d 
	@${RM} ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1 ../lamp_hardware/lamp_hw_dev_type_6/lamp_reference_system_power.c 
	@-${MV} ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.d ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/13636192/lamp_driver.p1: ../lamp_hardware/lamp_driver.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/13636192" 
	@${RM} ${OBJECTDIR}/_ext/13636192/lamp_driver.p1.d 
	@${RM} ${OBJECTDIR}/_ext/13636192/lamp_driver.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/13636192/lamp_driver.p1 ../lamp_hardware/lamp_driver.c 
	@-${MV} ${OBJECTDIR}/_ext/13636192/lamp_driver.d ${OBJECTDIR}/_ext/13636192/lamp_driver.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/13636192/lamp_driver.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/13636192/lamp_hardware.p1: ../lamp_hardware/lamp_hardware.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/13636192" 
	@${RM} ${OBJECTDIR}/_ext/13636192/lamp_hardware.p1.d 
	@${RM} ${OBJECTDIR}/_ext/13636192/lamp_hardware.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/13636192/lamp_hardware.p1 ../lamp_hardware/lamp_hardware.c 
	@-${MV} ${OBJECTDIR}/_ext/13636192/lamp_hardware.d ${OBJECTDIR}/_ext/13636192/lamp_hardware.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/13636192/lamp_hardware.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1: ../dali_library/dali_core/dali_dev_type_6/dali_cg_layer_dev_type_6.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2069721333" 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1 ../dali_library/dali_core/dali_dev_type_6/dali_cg_layer_dev_type_6.c 
	@-${MV} ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.d ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1: ../dali_library/dali_core/dali_dev_type_6/dali_cg_machine_dev_type_6.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2069721333" 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1 ../dali_library/dali_core/dali_dev_type_6/dali_cg_machine_dev_type_6.c 
	@-${MV} ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.d ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1: ../dali_library/dali_core/dali_dev_type_6/dali_cg_nvmemory_dev_type_6.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2069721333" 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1 ../dali_library/dali_core/dali_dev_type_6/dali_cg_nvmemory_dev_type_6.c 
	@-${MV} ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.d ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1: ../dali_library/dali_core/dali_dev_type_8/dali_cg_machine_dev_type_8.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2069721331" 
	@${RM} ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1 ../dali_library/dali_core/dali_dev_type_8/dali_cg_machine_dev_type_8.c 
	@-${MV} ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.d ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1: ../dali_library/dali_core/dali_dev_type_8/dali_cg_nvmemory_dev_type_8.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2069721331" 
	@${RM} ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1 ../dali_library/dali_core/dali_dev_type_8/dali_cg_nvmemory_dev_type_8.c 
	@-${MV} ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.d ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1: ../dali_library/dali_core/dali_general_cg_core/dali_cg_layer.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1268976915" 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1 ../dali_library/dali_core/dali_general_cg_core/dali_cg_layer.c 
	@-${MV} ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.d ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1: ../dali_library/dali_core/dali_general_cg_core/dali_cg_machine.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1268976915" 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1 ../dali_library/dali_core/dali_general_cg_core/dali_cg_machine.c 
	@-${MV} ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.d ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1: ../dali_library/dali_core/dali_general_cg_core/dali_cg_nvmemory.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1268976915" 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1 ../dali_library/dali_core/dali_general_cg_core/dali_cg_nvmemory.c 
	@-${MV} ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.d ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1: ../dali_library/dali_core/dali_hal/dali_cg_frameHandler_K42.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/643328669" 
	@${RM} ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1.d 
	@${RM} ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1 ../dali_library/dali_core/dali_hal/dali_cg_frameHandler_K42.c 
	@-${MV} ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.d ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1: ../dali_library/dali_core/dali_hal/dali_cg_hwLibInteraction.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/643328669" 
	@${RM} ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1.d 
	@${RM} ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1 ../dali_library/dali_core/dali_hal/dali_cg_hwLibInteraction.c 
	@-${MV} ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.d ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/clc1.p1: mcc_generated_files/clc1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/clc1.p1 mcc_generated_files/clc1.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/clc1.d ${OBJECTDIR}/mcc_generated_files/clc1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/clc1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/clc4.p1: mcc_generated_files/clc4.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc4.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc4.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/clc4.p1 mcc_generated_files/clc4.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/clc4.d ${OBJECTDIR}/mcc_generated_files/clc4.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/clc4.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/spi1.p1: mcc_generated_files/spi1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/spi1.p1 mcc_generated_files/spi1.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/spi1.d ${OBJECTDIR}/mcc_generated_files/spi1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/spi1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1: mcc_generated_files/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1 mcc_generated_files/interrupt_manager.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/clc3.p1: mcc_generated_files/clc3.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc3.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc3.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/clc3.p1 mcc_generated_files/clc3.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/clc3.d ${OBJECTDIR}/mcc_generated_files/clc3.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/clc3.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/tmr4.p1: mcc_generated_files/tmr4.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr4.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr4.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/tmr4.p1 mcc_generated_files/tmr4.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/tmr4.d ${OBJECTDIR}/mcc_generated_files/tmr4.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/tmr4.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/tmr2.p1: mcc_generated_files/tmr2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/tmr2.p1 mcc_generated_files/tmr2.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/tmr2.d ${OBJECTDIR}/mcc_generated_files/tmr2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/tmr2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/uart1.p1: mcc_generated_files/uart1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/uart1.p1 mcc_generated_files/uart1.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/uart1.d ${OBJECTDIR}/mcc_generated_files/uart1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/uart1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.p1: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 mcc_generated_files/pin_manager.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/pin_manager.d ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/tmr6.p1: mcc_generated_files/tmr6.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr6.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr6.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/tmr6.p1 mcc_generated_files/tmr6.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/tmr6.d ${OBJECTDIR}/mcc_generated_files/tmr6.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/tmr6.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/pwm5.p1: mcc_generated_files/pwm5.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm5.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm5.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/pwm5.p1 mcc_generated_files/pwm5.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/pwm5.d ${OBJECTDIR}/mcc_generated_files/pwm5.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/pwm5.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/mcc.p1: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/mcc.p1 mcc_generated_files/mcc.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/mcc.d ${OBJECTDIR}/mcc_generated_files/mcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/mcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/adcc.p1: mcc_generated_files/adcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adcc.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/adcc.p1 mcc_generated_files/adcc.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/adcc.d ${OBJECTDIR}/mcc_generated_files/adcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/adcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/memory.p1: mcc_generated_files/memory.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/memory.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/memory.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/memory.p1 mcc_generated_files/memory.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/memory.d ${OBJECTDIR}/mcc_generated_files/memory.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/memory.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/debug_console.p1: ../dali_library/debug_console.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/debug_console.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/debug_console.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/debug_console.p1 ../dali_library/debug_console.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/debug_console.d ${OBJECTDIR}/_ext/1726407717/debug_console.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/debug_console.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/debug_uart2.p1: ../dali_library/debug_uart2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1 ../dali_library/debug_uart2.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/debug_uart2.d ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/dali_diag.p1: ../dali_library/dali_diag.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/dali_diag.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/dali_diag.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/dali_diag.p1 ../dali_library/dali_diag.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/dali_diag.d ${OBJECTDIR}/_ext/1726407717/dali_diag.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/dali_diag.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1: ../dali_library/dali_diag_terminal.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1 ../dali_library/dali_diag_terminal.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.d ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1: ../dali_library/app_dali_cg.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1 ../dali_library/app_dali_cg.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/app_dali_cg.d ${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/main.p1: ../dali_library/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/main.p1 ../dali_library/main.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/main.d ${OBJECTDIR}/_ext/1726407717/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/275292492/random.p1: ../drivers_peripherals/random.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/275292492" 
	@${RM} ${OBJECTDIR}/_ext/275292492/random.p1.d 
	@${RM} ${OBJECTDIR}/_ext/275292492/random.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/275292492/random.p1 ../drivers_peripherals/random.c 
	@-${MV} ${OBJECTDIR}/_ext/275292492/random.d ${OBJECTDIR}/_ext/275292492/random.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/275292492/random.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1: ../lamp_hardware/lamp_hw_dev_type_6/lamp_hardware_dev_type_6.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/856521997" 
	@${RM} ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1.d 
	@${RM} ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1 ../lamp_hardware/lamp_hw_dev_type_6/lamp_hardware_dev_type_6.c 
	@-${MV} ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.d ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/856521997/lamp_hardware_dev_type_6.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1: ../lamp_hardware/lamp_hw_dev_type_6/lamp_reference_system_power.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/856521997" 
	@${RM} ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1.d 
	@${RM} ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1 ../lamp_hardware/lamp_hw_dev_type_6/lamp_reference_system_power.c 
	@-${MV} ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.d ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/856521997/lamp_reference_system_power.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/13636192/lamp_driver.p1: ../lamp_hardware/lamp_driver.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/13636192" 
	@${RM} ${OBJECTDIR}/_ext/13636192/lamp_driver.p1.d 
	@${RM} ${OBJECTDIR}/_ext/13636192/lamp_driver.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/13636192/lamp_driver.p1 ../lamp_hardware/lamp_driver.c 
	@-${MV} ${OBJECTDIR}/_ext/13636192/lamp_driver.d ${OBJECTDIR}/_ext/13636192/lamp_driver.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/13636192/lamp_driver.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/13636192/lamp_hardware.p1: ../lamp_hardware/lamp_hardware.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/13636192" 
	@${RM} ${OBJECTDIR}/_ext/13636192/lamp_hardware.p1.d 
	@${RM} ${OBJECTDIR}/_ext/13636192/lamp_hardware.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/13636192/lamp_hardware.p1 ../lamp_hardware/lamp_hardware.c 
	@-${MV} ${OBJECTDIR}/_ext/13636192/lamp_hardware.d ${OBJECTDIR}/_ext/13636192/lamp_hardware.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/13636192/lamp_hardware.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1: ../dali_library/dali_core/dali_dev_type_6/dali_cg_layer_dev_type_6.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2069721333" 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1 ../dali_library/dali_core/dali_dev_type_6/dali_cg_layer_dev_type_6.c 
	@-${MV} ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.d ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2069721333/dali_cg_layer_dev_type_6.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1: ../dali_library/dali_core/dali_dev_type_6/dali_cg_machine_dev_type_6.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2069721333" 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1 ../dali_library/dali_core/dali_dev_type_6/dali_cg_machine_dev_type_6.c 
	@-${MV} ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.d ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2069721333/dali_cg_machine_dev_type_6.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1: ../dali_library/dali_core/dali_dev_type_6/dali_cg_nvmemory_dev_type_6.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2069721333" 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1 ../dali_library/dali_core/dali_dev_type_6/dali_cg_nvmemory_dev_type_6.c 
	@-${MV} ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.d ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2069721333/dali_cg_nvmemory_dev_type_6.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1: ../dali_library/dali_core/dali_dev_type_8/dali_cg_machine_dev_type_8.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2069721331" 
	@${RM} ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1 ../dali_library/dali_core/dali_dev_type_8/dali_cg_machine_dev_type_8.c 
	@-${MV} ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.d ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2069721331/dali_cg_machine_dev_type_8.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1: ../dali_library/dali_core/dali_dev_type_8/dali_cg_nvmemory_dev_type_8.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2069721331" 
	@${RM} ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1 ../dali_library/dali_core/dali_dev_type_8/dali_cg_nvmemory_dev_type_8.c 
	@-${MV} ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.d ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2069721331/dali_cg_nvmemory_dev_type_8.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1: ../dali_library/dali_core/dali_general_cg_core/dali_cg_layer.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1268976915" 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1 ../dali_library/dali_core/dali_general_cg_core/dali_cg_layer.c 
	@-${MV} ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.d ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1268976915/dali_cg_layer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1: ../dali_library/dali_core/dali_general_cg_core/dali_cg_machine.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1268976915" 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1 ../dali_library/dali_core/dali_general_cg_core/dali_cg_machine.c 
	@-${MV} ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.d ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1268976915/dali_cg_machine.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1: ../dali_library/dali_core/dali_general_cg_core/dali_cg_nvmemory.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1268976915" 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1 ../dali_library/dali_core/dali_general_cg_core/dali_cg_nvmemory.c 
	@-${MV} ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.d ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1268976915/dali_cg_nvmemory.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1: ../dali_library/dali_core/dali_hal/dali_cg_frameHandler_K42.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/643328669" 
	@${RM} ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1.d 
	@${RM} ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1 ../dali_library/dali_core/dali_hal/dali_cg_frameHandler_K42.c 
	@-${MV} ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.d ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/643328669/dali_cg_frameHandler_K42.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1: ../dali_library/dali_core/dali_hal/dali_cg_hwLibInteraction.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/643328669" 
	@${RM} ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1.d 
	@${RM} ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1 ../dali_library/dali_core/dali_hal/dali_cg_hwLibInteraction.c 
	@-${MV} ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.d ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/643328669/dali_cg_hwLibInteraction.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/clc1.p1: mcc_generated_files/clc1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/clc1.p1 mcc_generated_files/clc1.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/clc1.d ${OBJECTDIR}/mcc_generated_files/clc1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/clc1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/clc4.p1: mcc_generated_files/clc4.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc4.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc4.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/clc4.p1 mcc_generated_files/clc4.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/clc4.d ${OBJECTDIR}/mcc_generated_files/clc4.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/clc4.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/spi1.p1: mcc_generated_files/spi1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/spi1.p1 mcc_generated_files/spi1.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/spi1.d ${OBJECTDIR}/mcc_generated_files/spi1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/spi1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1: mcc_generated_files/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1 mcc_generated_files/interrupt_manager.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/clc3.p1: mcc_generated_files/clc3.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc3.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc3.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/clc3.p1 mcc_generated_files/clc3.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/clc3.d ${OBJECTDIR}/mcc_generated_files/clc3.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/clc3.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/tmr4.p1: mcc_generated_files/tmr4.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr4.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr4.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/tmr4.p1 mcc_generated_files/tmr4.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/tmr4.d ${OBJECTDIR}/mcc_generated_files/tmr4.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/tmr4.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/tmr2.p1: mcc_generated_files/tmr2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/tmr2.p1 mcc_generated_files/tmr2.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/tmr2.d ${OBJECTDIR}/mcc_generated_files/tmr2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/tmr2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/uart1.p1: mcc_generated_files/uart1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/uart1.p1 mcc_generated_files/uart1.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/uart1.d ${OBJECTDIR}/mcc_generated_files/uart1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/uart1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.p1: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 mcc_generated_files/pin_manager.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/pin_manager.d ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/tmr6.p1: mcc_generated_files/tmr6.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr6.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr6.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/tmr6.p1 mcc_generated_files/tmr6.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/tmr6.d ${OBJECTDIR}/mcc_generated_files/tmr6.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/tmr6.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/pwm5.p1: mcc_generated_files/pwm5.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm5.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm5.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/pwm5.p1 mcc_generated_files/pwm5.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/pwm5.d ${OBJECTDIR}/mcc_generated_files/pwm5.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/pwm5.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/mcc.p1: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/mcc.p1 mcc_generated_files/mcc.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/mcc.d ${OBJECTDIR}/mcc_generated_files/mcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/mcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/adcc.p1: mcc_generated_files/adcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adcc.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/adcc.p1 mcc_generated_files/adcc.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/adcc.d ${OBJECTDIR}/mcc_generated_files/adcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/adcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/mcc_generated_files/memory.p1: mcc_generated_files/memory.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/memory.p1.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/memory.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/mcc_generated_files/memory.p1 mcc_generated_files/memory.c 
	@-${MV} ${OBJECTDIR}/mcc_generated_files/memory.d ${OBJECTDIR}/mcc_generated_files/memory.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/mcc_generated_files/memory.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/debug_console.p1: ../dali_library/debug_console.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/debug_console.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/debug_console.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/debug_console.p1 ../dali_library/debug_console.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/debug_console.d ${OBJECTDIR}/_ext/1726407717/debug_console.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/debug_console.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/debug_uart2.p1: ../dali_library/debug_uart2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1 ../dali_library/debug_uart2.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/debug_uart2.d ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/debug_uart2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/dali_diag.p1: ../dali_library/dali_diag.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/dali_diag.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/dali_diag.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/dali_diag.p1 ../dali_library/dali_diag.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/dali_diag.d ${OBJECTDIR}/_ext/1726407717/dali_diag.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/dali_diag.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1: ../dali_library/dali_diag_terminal.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1 ../dali_library/dali_diag_terminal.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.d ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/dali_diag_terminal.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1: ../dali_library/app_dali_cg.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1 ../dali_library/app_dali_cg.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/app_dali_cg.d ${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/app_dali_cg.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1726407717/main.p1: ../dali_library/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1726407717" 
	@${RM} ${OBJECTDIR}/_ext/1726407717/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1726407717/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1726407717/main.p1 ../dali_library/main.c 
	@-${MV} ${OBJECTDIR}/_ext/1726407717/main.d ${OBJECTDIR}/_ext/1726407717/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1726407717/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/DALI_CG_PIC18F47K42.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/DALI_CG_PIC18F47K42.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=none  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -gdwarf-3 -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/DALI_CG_PIC18F47K42.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/DALI_CG_PIC18F47K42.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/DALI_CG_PIC18F47K42.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/DALI_CG_PIC18F47K42.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -maddrqual=ignore -DDALI_ROLE_CONTROL_DEVICE -xassembler-with-cpp -I"../dali_library" -I"../dali_library/dali_core" -I"../dali_library/dali_core/dali_hal" -I"../drivers_peripherals" -I"mcc_generated_files" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/DALI_CG_PIC18F47K42.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
