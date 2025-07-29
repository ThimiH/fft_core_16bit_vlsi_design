# =========[ PrimePower Analysis Script ]=========
# Created by: Thimira Hirushan
# Date: 2025-07-29
# Project: FFT Core 16-bit VLSI Design
# Description: PrimePower script for power analysis using SkyWater 130nm PDK

# ======== Setup and Directory Configuration ========
set DESIGN_NAME "fft_top"
set NETLIST_DIR "../netlists"
set TECH_DIR "../libs/sky130_library"
set REPORTS_DIR "reports"
set OUTPUTS_DIR "outputs"
set VCD_DIR "simulation"

# Create output directories
file mkdir $REPORTS_DIR
file mkdir $OUTPUTS_DIR

# Set search paths
set_app_var search_path ". $TECH_DIR $NETLIST_DIR $VCD_DIR"

# ======== Power Analysis Configuration ========
set_app_var power_enable_analysis true
set_app_var power_analysis_mode averaged

# ======== 1. Library Setup ========
# Read liberty files for SkyWater 130nm PDK
read_lib "$TECH_DIR/liberty/sky130_fd_sc_hd__tt_025C_1v80.lib"

# ======== 2. Design Setup ========
# Read design netlist
read_verilog "$NETLIST_DIR/${DESIGN_NAME}_final.v"
current_design $DESIGN_NAME

# Link design
link_design

# ======== 3. Read Constraints ========
# Read SDC constraints
read_sdc "$NETLIST_DIR/${DESIGN_NAME}_final.sdc"

# ======== 4. Read Activity Data ========
# Read switching activity file (VCD or SAIF)
read_vcd "$VCD_DIR/${DESIGN_NAME}.vcd" -strip_path testbench/dut

# ======== 5. Power Analysis Configuration ========
# Set power analysis options
set_power_analysis_options -waveform_format vcd -waveform_output power_results

# ======== 6. Run Power Analysis ========
update_power

# ======== 7. Generate Power Reports ========
# Comprehensive power breakdown
report_power -analysis_effort medium -verbose > $REPORTS_DIR/power_report_detailed.rpt
report_power -hierarchy > $REPORTS_DIR/power_hierarchy.rpt
report_power -net > $REPORTS_DIR/power_nets.rpt

# Individual power component reports
report_power -internal > $REPORTS_DIR/internal_power.rpt
report_power -switching > $REPORTS_DIR/switching_power.rpt
report_power -leakage > $REPORTS_DIR/leakage_power.rpt

# Power summary by clock domain
report_power -clock_network > $REPORTS_DIR/clock_power.rpt

# Power by voltage domain
report_power -voltage > $REPORTS_DIR/voltage_power.rpt

# ======== 8. Save Results ========
# Save power database
save_power_database $OUTPUTS_DIR/${DESIGN_NAME}_power_analysis.pdb

# Write power data in various formats
write_power_data -format spef $OUTPUTS_DIR/${DESIGN_NAME}_power.spef
write_power_data -format ptpx $OUTPUTS_DIR/${DESIGN_NAME}_power.ptpx

# ======== 9. Summary Report ========
echo "==========================================="
echo "PrimePower Analysis Completed Successfully"
echo "==========================================="
echo "Design: $DESIGN_NAME"
echo "Technology: SkyWater 130nm"
echo "Reports generated in: $REPORTS_DIR"
echo "Power data saved in: $OUTPUTS_DIR"
echo ""
echo "Key Reports:"
echo "- Detailed Power: power_report_detailed.rpt"
echo "- Internal Power: internal_power.rpt"
echo "- Switching Power: switching_power.rpt"
echo "- Leakage Power: leakage_power.rpt"
echo "==========================================="

# Exit cleanly
exit