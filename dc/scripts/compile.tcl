# Created by: Thimira Hirushan
# Date: 2025-07-04
# Project: FFT Core 16-bit VLSI Design
# Description: This script compiles the FFT design using Design Compiler.

# ======== Directory Configuration ========
set project_root   "../"
set log_dir        "${project_root}/dc/logs"
set netlist_dir    "${project_root}/netlists"
set report_dir     "${project_root}/dc/reports"

# Create directories if they don't exist
file mkdir $log_dir
file mkdir $netlist_dir
file mkdir $report_dir

# =========[ Design Compiler Synthesis Script ]=========

# Set library
set target_library [list ../libs/sky130_fd_sc_hd/sky130_fd_sc_hd__tt_025C_1v80.db]
set link_library [list * $target_library]
# set synthetic_library [list dw_foundation.sldb]

# Read Verilog files (Update file list as needed)
read_verilog {
  ../rtl/modules/fft_ctrl_sm.v
  ../rtl/modules/butterfly.v
  ../rtl/modules/w_lut.v
  ../rtl/modules/mem_32x16.v
  ../rtl/modules/read_addr_lut.v
  ../rtl/fft_top.v
}
current_design fft_top

# Read SDC constraints file
puts "Reading SDC constraints..."
read_sdc ../constraints/fft_top.sdc
puts "SDC constraints loaded successfully."

# Check constraints before compilation
puts "Checking design constraints..."
check_design
check_timing

# Compile
compile_ultra

# Generate reports
# report_timing -to [get_ports "out_real_F[*]"] > reports/timing_out_real.rpt
# report_timing -to [get_ports "out_imag_F[*]"] > reports/timing_out_imag.rpt
report_timing -max_paths 10 -transition_time -nets -input_pins > reports/timing_summary.rpt
report_constraint -all_violators > reports/constraint_violations.rpt
report_clock -attributes > reports/clock_report.rpt
report_power > reports/power.rpt
report_area > reports/area.rpt
report_port -verbose > reports/ports.rpt

# Write synthesized netlist
write -format verilog -hierarchy -output ../netlists/fft_netlist.v

# Save DC session info for Formality
write_sdf -version 2.1 ../netlists/fft.sdf

# Write SDC file for downstream tools (P&R, STA)
write_sdc ../netlists/fft_constraints.sdc

# Write design database for reference
write -format ddc -hierarchy -output ../netlists/fft_top.ddc

# # Exit
# exit
