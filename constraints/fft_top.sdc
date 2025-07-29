# ==============================================================================
# SDC File for FFT Top Module
# Created by: Thimira Hirushan
# Date: 2025-07-22
# Project: 16-bit FFT module VLSI Design
# Description: Synopsys Design Constraints file for timing and design rules
# ==============================================================================

# ==============================================================================
# Clock Definition
# ==============================================================================
# Define primary clock with 10ns period (100MHz)
create_clock -name MYCLK -period 10.0 [get_ports clk]

# Set clock uncertainty for setup and hold
set_clock_uncertainty -setup 1.0 [get_clocks MYCLK]
set_clock_uncertainty -hold 0.2 [get_clocks MYCLK]

# Set clock transition time
set_clock_transition 0.1 [get_clocks MYCLK]

# ==============================================================================
# Input Constraints
# ==============================================================================
# Input delay constraints (assume external logic has 2ns delay)
set_input_delay -clock MYCLK -max 2.0 [get_ports {in_real[*]}]
set_input_delay -clock MYCLK -min 0.1 [get_ports {in_real[*]}]
set_input_delay -clock MYCLK -max 2.0 [get_ports {in_imag[*]}]
set_input_delay -clock MYCLK -min 0.1 [get_ports {in_imag[*]}]

# Control signal input delays
set_input_delay -clock MYCLK -max 1.5 [get_ports in_push]
set_input_delay -clock MYCLK -min 0.1 [get_ports in_push]
set_input_delay -clock MYCLK -max 1.5 [get_ports out_stall]
set_input_delay -clock MYCLK -min 0.1 [get_ports out_stall]

# Reset is asynchronous - no input delay constraint needed
set_input_delay -clock MYCLK -max 0.0 [get_ports reset]
set_input_delay -clock MYCLK -min 0.0 [get_ports reset]

# ==============================================================================
# Output Constraints
# ==============================================================================
# Output delay constraints (assume external logic needs 2ns setup)
set_output_delay -clock MYCLK -max 2.0 [get_ports {out_real_F[*]}]
set_output_delay -clock MYCLK -min 0.1 [get_ports {out_real_F[*]}]
set_output_delay -clock MYCLK -max 2.0 [get_ports {out_imag_F[*]}]
set_output_delay -clock MYCLK -min 0.1 [get_ports {out_imag_F[*]}]

# Control signal output delays
set_output_delay -clock MYCLK -max 1.5 [get_ports out_push_F]
set_output_delay -clock MYCLK -min 0.1 [get_ports out_push_F]
set_output_delay -clock MYCLK -max 1.5 [get_ports in_stall]
set_output_delay -clock MYCLK -min 0.1 [get_ports in_stall]

# ==============================================================================
# Environmental Constraints
# ==============================================================================
# Operating conditions (already defined in library)
# set_operating_conditions tt_025C_1v80

# Wire load model (if not auto-selected)
# set_wire_load_model -name "small" -library sky130_fd_sc_hd

# ==============================================================================
# Design Rule Constraints
# ==============================================================================
# Set maximum transition time for all inputs
set_max_transition 0.5 [get_ports -filter "direction==in"]

# Set maximum transition time for all nets
set_max_transition 0.8 [all_nets]

# Set maximum fanout
set_max_fanout 16 [all_inputs]

# Set maximum capacitance
set_max_capacitance 0.1 [all_outputs]

# ==============================================================================
# Area and Power Constraints
# ==============================================================================
# Set maximum area constraint (based on current synthesis: ~57,000 µm²)
# Target 10% area reduction for optimization
set_max_area 51000

# Power optimization settings
# Set maximum dynamic power constraint (in watts)
# Adjust based on your power budget requirements
set_max_dynamic_power 0.010

# Set maximum leakage power constraint (in watts)
set_max_leakage_power 0.001

# Enable power optimization during synthesis
set_power_optimize_enable true

# Set activity factor for power estimation
# Default activity factor for data signals (10%)
set_switching_activity -static_probability 0.5 -activity 0.1 [get_ports {in_real[*]}]
set_switching_activity -static_probability 0.5 -activity 0.1 [get_ports {in_imag[*]}]
set_switching_activity -static_probability 0.5 -activity 0.1 [get_ports {out_real_F[*]}]
set_switching_activity -static_probability 0.5 -activity 0.1 [get_ports {out_imag_F[*]}]

# Control signal activity (lower activity - 5%)
set_switching_activity -static_probability 0.5 -activity 0.05 [get_ports in_push]
set_switching_activity -static_probability 0.5 -activity 0.05 [get_ports out_push_F]
set_switching_activity -static_probability 0.5 -activity 0.05 [get_ports in_stall]
set_switching_activity -static_probability 0.5 -activity 0.05 [get_ports out_stall]

# Clock activity (100% - always switching)
set_switching_activity -static_probability 0.5 -activity 1.0 [get_ports clk]

# Reset activity (very low - 1%)
set_switching_activity -static_probability 0.9 -activity 0.01 [get_ports reset]

# ==============================================================================
# False Paths and Multicycle Paths
# ==============================================================================
# Reset is asynchronous - set false path from reset to all registers
set_false_path -from [get_ports reset] -to [all_registers]

# If there are any clock domain crossings, they would be defined here
# Example: set_false_path -from [get_clocks clk1] -to [get_clocks clk2]

# ==============================================================================
# Clock Gating Constraints (if applicable)
# ==============================================================================
# Set clock gating check if clock gating is used
# set_clock_gating_check -setup 0.2 -hold 0.1

# ==============================================================================
# Additional Constraints
# ==============================================================================
# Group related logic to improve optimization
group_path -name "input_paths" -from [all_inputs] -to [all_registers]
group_path -name "output_paths" -from [all_registers] -to [all_outputs]
group_path -name "reg_to_reg" -from [all_registers] -to [all_registers]

# Set optimization priorities
# Higher weight means higher priority for optimization
set_cost_priority -delay 1
set_cost_priority -area 2  
set_cost_priority -power 3

# Enable area recovery during optimization
set_area_recovery true

# Set case analysis for static signals (if any)
# Example: set_case_analysis 1 [get_ports enable]

# Set don't touch on critical paths if needed
# set_dont_touch [get_cells critical_cell_instance]

# Set size only constraints for specific cells if needed
# set_size_only [get_cells memory_cells]

# ==============================================================================
# End of SDC File
# ==============================================================================
