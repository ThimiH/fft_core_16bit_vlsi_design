# ========== Formality Equivalence Checking Script ==========

# Create reports directory if it doesn't exist
file mkdir reports
file mkdir outputs

# Read SVF from DC
set_svf ../dc/default.svf

# Read standard cell library for implementation design
read_db ../libs/sky130_fd_sc_hd/sky130_fd_sc_hd__tt_025C_1v80.db

# Read original RTL (Reference design) - MUST be done before set_top
read_verilog -r ../rtl/modules/fft_ctrl_sm.v
read_verilog -r ../rtl/modules/butterfly.v
read_verilog -r ../rtl/modules/w_lut.v
read_verilog -r ../rtl/modules/mem_32x16.v
read_verilog -r ../rtl/modules/read_addr_lut.v
read_verilog -r ../rtl/fft_top.v

# Set reference design
set_reference_design fft_top
set_top fft_top

# Read synthesized netlist (Implementation design)
read_verilog -i ../netlists/fft_netlist.v

# Set implementation design
set_implementation_design fft_top

# Match points (equivalence points)
match

# Verify equivalence
verify

# Generate comprehensive reports
report_status > reports/formality_status.rpt
report_setup_status > reports/formality_setup_status.rpt
report_matched_points > reports/formality_matched_points.rpt
report_failing_points > reports/formality_failing_points.rpt
report_passing_points > reports/formality_passing_points.rpt
report_unmatched_points > reports/formality_unmatched_points.rpt

# Save the verification results (if these commands exist in your version)
# write_formality -output outputs/formality_results.dcn
# write_formality_report -output reports/formality_report.rpt

# Exit
exit
