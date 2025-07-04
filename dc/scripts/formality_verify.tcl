# ========== Formality Equivalence Checking Script ==========

# Read SVF from DC
read_svf -input ../netlist/fft.svf

# Set top module
set_top fft_top

# Read original RTL (Golden)
read_verilog -golden ../rtl/modules/fft_ctrl_sm.v
read_verilog -golden ../rtl/modules/butterfly.v
read_verilog -golden ../rtl/modules/w_lut.v
read_verilog -golden ../rtl/modules/mem_32x16.v
read_verilog -golden ../rtl/fft_top.v

# Read synthesized netlist (Revised)
read_verilog -revised ../netlist/fft_netlist.v

# Match points (equivalence points)
match

# Verify equivalence
verify

# Report
report_verification > reports/formality_verification_summary.rpt

# Save the verification results
write_formality -output outputs/formality_results.dcn
# Save the verification report
write_formality_report -output reports/formality_report.rpt

# Exit
exit