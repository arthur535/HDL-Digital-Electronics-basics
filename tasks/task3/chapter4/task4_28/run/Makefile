########################################################################################
# Copyright (C) 2023-2023 Grovf Inc. All Rights Reserved.
#
# This is the sample Makefile for non-uvm educational testbenches.
# Good for sandbox
#
# Contributors:
# N. Zibilyuk nazar.z@grovf.com
########################################################################################

.DEFAULT_GOAL := all

########################################################################################
# Set this to 1 for live simulation with gui, for example for stopping at
# breakpoints, etc.
# You can pass this via command-line
GUI ?= 0

########################################################################################
# Always use random seed for simulation run, but override when reproducing previous run
# for example, to reproduce error
# Here we get random value from shell (bash) variable RANDOM
# try 'echo $RANDOM' in your bash shell, to try
SEED ?= $(shell bash -c 'echo $$RANDOM')



MAKEFILE_FILE := $(lastword $(MAKEFILE_LIST))
MAKEFILE_HOME := $(dir $(MAKEFILE_FILE))
VERIF_DIR :=  $(MAKEFILE_HOME)/..
RTL_DIR :=  $(MAKEFILE_HOME)/../rtl
TB_DIR :=  $(VERIF_DIR)/tb



########################################################################################
# Source files

# RTL Under Test (DUT)
# Just create here list of your design files
RTL_SRC += $(RTL_DIR)/dec2to4.v $(RTL_DIR)/task4_28.v

# Testbench
# Just create here list of your testbench files
TB_SRC  += $(TB_DIR)/tb_dec2to4.v $(TB_DIR)/tb_task4_28.v


# Use top of Testbench as a common top file
TOP := top_testbench


########################################################################################
# Common compilation options

# We plan to use 64-bit binaries (tools) only
COMMON_COMPILE_OPTS += -64

# We plan to use 64-bit binaries (tools) only
# All our souces to be compiled using SystemVerilog, not Verilog
COMMON_COMPILE_OPTS += -sv

# This option makes VLOG to follow LRM and not relax rules
# For example, 'input clk' will be rathert reated as 'input logic clk',
# and not as 'input bit clk'
DUT_COMPILE_OPTS += -svinputport=net


########################################################################################
# Debug, Accessibility and Visibility Options
VOPT_OPTS += -64

# Simulation Database containing Testbench and Design Hierarchy
VOPT_OPTS += -designfile design.bin

# Turn on Debug options to be able to dump waveforms
ifeq ($(GUI), 1)
	VOPT_OPTS += -debug,livesim
else
	VOPT_OPTS += -debug
endif

# Allow Assert debug with vsim -assertdebug option
VOPT_OPTS += -assertdebug


########################################################################################
# Simulation Runtime Options

# Set up namve for waveform database
TB_RUN_OPTS += -qwavedb=+wavefile=qwave.db

# Settings for messages to be visible in both visualizer, stdout and log file
TB_RUN_OPTS += -qwavedb=+msg
TB_RUN_OPTS += -qwavedb=+msgmode=both
TB_RUN_OPTS += -qwavedb=+displaymsgmode=both

# Make simulation dumb signals as well, without this option it only dumps only
# nets and variables directly used in properties
TB_RUN_OPTS += -qwavedb=+signal

# Store debug information for Assertions in database
TB_RUN_OPTS += -qwavedb=+assertion
TB_RUN_OPTS += -assertdebug

# Dump STDOUT messages to visualizer database
TB_RUN_OPTS += -visteestdout

# Verification team relies on post-simulation debug flow and run tests in batch
# There are options to use live simulation, but the intention of this course
# is to teach you the main flow, that runs simulaitons without any interaction needed
# what makes it possible to run regressions automatically, i.e. allows for automation
ifeq ($(GUI), 1)
	TB_RUN_OPTS += -visualizer=design.bin
else
	TB_RUN_OPTS += -batch
	TB_RUN_OPTS	+= -do "run -all; exit"
endif



.PHONY: all
all: compile optimize simulate


.PHONY: compile
compile: results dut tb


.PHONY: dut
dut: results
	vlog                        \
		$(COMMON_COMPILE_OPTS)  \
		$(DUT_COMPILE_OPTS)     \
		$(RTL_SRC)              \
		-l results/$@.log       \


.PHONY: tb
tb:
	vlog                        \
		$(COMMON_COMPILE_OPTS)  \
		$(TB_SRC)               \
		-l results/$@.log       \


.PHONY: optimize
optimize:
	vopt                  \
		$(VOPT_OPTS)      \
		$(TOP)            \
		-o tb_opt         \
		-l results/$@.log \


.PHONY: simulate
simulate:
	vsim                          \
		$(TB_RUN_OPTS)            \
		tb_opt                    \
		-l results/$@_$(SEED).log \
		

.PHONY: visualizer
visualizer:
	visualizer                 \
		-designfile design.bin \
		-wavefile qwave.db     \

results:
	@mkdir -pv results


.PHONY: clean
clean:
	@rm -rf results
	@rm -rf work
	@rm -rf .visualizer/
	@rm -rf formal/
	@rm -rf .qverify/
	@rm -f visualizer.log transaction.config
	@rm -f design.bin qwave.db
	@rm -f visualizer.ses visualizerSave.ses
	@rm -f hdlserver.vstf


