################################################################################
#
# Design name:  fft_top
#
# Created by icc2 write_sdc on Tue Jul 29 20:43:15 2025
#
################################################################################

set sdc_version 2.1
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000
# capacitive_load_unit    : 1e-12
# voltage_unit            : 1
# current_unit            : 0.001
# power_unit              : 1e-09
################################################################################


# Mode: default
# Corner: default
# Scenario: default

# interactive commands, line 1
create_clock -name clk -period 10 -waveform {0 5} [get_ports {clk}]
# Warning: Libcell power domain derates are skipped!

