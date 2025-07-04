# Created by: Thimira Hirushan
# Date: 2025-07-04
# Project: FFT Core 16-bit VLSI Design
# Description: This script compiles the FFT design using Design Compiler.

# =========[ Design Compiler Synthesis Script ]=========
# Set library
set target_library [list ../libs/sky130_fd_sc_hd/sky130_fd_sc_hd__tt_025C_1v80.db]
set link_library [list * $target_library]
set synthetic_library [list dw_foundation.sldb]

# Read Verilog files (Update file list as needed)
read_verilog {
  ../rtl/modules/fft_ctrl_sm.v
  ../rtl/modules/butterfly.v
  ../rtl/modules/w_lut.v
  ../rtl/modules/mem_32x16.v
  ../rtl/fft_top.v
}
current_design fft_top

# Set clock
create_clock -name MYCLK -period 10 [get_ports clk]
set_clock_uncertainty 1.0 [get_clocks MYCLK]
set_clock_uncertainty -hold 0.2 [get_clocks MYCLK]

# Input delays
set_input_delay -max 2 [get_ports "in_real[*]"]
set_input_delay -min 0.1 [get_ports "in_real[*]"]
set_input_delay -max 2 [get_ports "in_imag[*]"]
set_input_delay -min 0.1 [get_ports "in_imag[*]"]

# Output delays
set_output_delay -max 2 [get_ports "out_real_F[*]"]
set_output_delay -min 0.1 [get_ports "out_real_F[*]"]
set_output_delay -max 2 [get_ports "out_imag_F[*]"]
set_output_delay -min 0.1 [get_ports "out_imag_F[*]"]

# Compile
compile_ultra

# Generate reports
report_timing -to [get_ports "out_real_F[*]"] > reports/timing_out_real.rpt
report_timing -to [get_ports "out_imag_F[*]"] > reports/timing_out_imag.rpt
report_power > reports/power.rpt
report_area > reports/area.rpt
report_port -verbose > reports/ports.rpt

# Write synthesized netlist
write -format verilog -hierarchy -output ../netlist/fft_netlist.v

# Save DC session info for Formality
write_sdf -version 2.1 ../netlist/fft.sdf
write_svf -output ../netlist/fft.svf

# Save the design state
write_design -output ../netlist/fft_design.dcn
# Save the design in a format suitable for Formality
write_formality -output ../netlist/fft_formality.dcn
# Save the design in a format suitable for RTL Viewer
write_rtl_viewer -output ../netlist/fft_rtl_viewer.dcn
# Save the design in a format suitable for Verilog simulation
write_verilog -output ../netlist/fft_sim.v
# Save the design in a format suitable for VCD generation
write_vcd -output ../netlist/fft.vcd
# Save the design in a format suitable for GDSII generation
write_gds -output ../netlist/fft.gds

# # Exit
# exit