# =========[ PrimePower Analysis Script ]=========
# Created by: Thimira Hirushan
# Date: 2025-07-29
# Project: FFT Core 16-bit VLSI Design
# Description: PrimePower script for power analysis using SkyWater 130nm PDK

# ======== Setup and Directory Configuration ========
set DESIGN_NAME "fft_top"
set NETLIST_DIR "../netlists"
set TECH_DIR "../libs/sky130_fd_sc_hd"
set REPORTS_DIR "reports"
set OUTPUTS_DIR "outputs"

# Create output directories
file mkdir $REPORTS_DIR
file mkdir $OUTPUTS_DIR

# Set search paths
set_app_var search_path ". $TECH_DIR $NETLIST_DIR"

# ======== Power Analysis Configuration ========
set_app_var power_enable_analysis true
set_app_var power_analysis_mode averaged

# ======== 1. Library Setup ========
# Read liberty files for SkyWater 130nm PDK
read_file "$TECH_DIR/sky130_fd_sc_hd__tt_025C_1v80.db"

set_app_var target_library "sky130_fd_sc_hd__tt_025C_1v80.db"
set_app_var link_library "* sky130_fd_sc_hd__tt_025C_1v80.db"

# ======== 2. Design Setup ========
# Read design netlist
read_verilog "$NETLIST_DIR/fft_netlist.v"
current_design $DESIGN_NAME

# Link design
link_design

# ======== 3. Read Constraints ========
# Read SDC constraints
read_sdc "$NETLIST_DIR/fft_constraints.sdc"

# # ======== 4. Set Default Switching Activity (No VCD file) ========
# # Set default switching activity for all nets
# set_switching_activity -static_probability 0.5 -toggle_rate 0.1 [get_nets *]

# # Set specific activity for clock nets (higher toggle rate)
# if {[sizeof_collection [get_nets *clk*]] > 0} {
#     set_switching_activity -static_probability 0.5 -toggle_rate 1.0 [get_nets *clk*]
# }

# # Set specific activity for reset nets (lower toggle rate)
# if {[sizeof_collection [get_nets *rst*]] > 0} {
#     set_switching_activity -static_probability 0.1 -toggle_rate 0.01 [get_nets *rst*]
# }

# # Set activity for input ports
# set_switching_activity -static_probability 0.5 -toggle_rate 0.2 [get_ports data_in*]
# set_switching_activity -static_probability 0.2 -toggle_rate 0.05 [get_ports start]

# # ======== 5. Power Analysis Configuration ========
# # Set power analysis options for default activity mode
# set_power_analysis_options -effort medium

# ======== 6. Run Power Analysis ========
update_power

# ======== 7. Generate Power Reports ========
report_power > $REPORTS_DIR/power_report.rpt

# Comprehensive power breakdown
# report_power -analysis_effort medium -verbose > $REPORTS_DIR/power_report_detailed.rpt
# report_power -hierarchy > $REPORTS_DIR/power_hierarchy.rpt
# report_power -net > $REPORTS_DIR/power_nets.rpt

# # Individual power component reports
# report_power -internal > $REPORTS_DIR/internal_power.rpt
# report_power -switching > $REPORTS_DIR/switching_power.rpt
# report_power -leakage > $REPORTS_DIR/leakage_power.rpt

# # Power summary by clock domain
# report_power -clock_network > $REPORTS_DIR/clock_power.rpt

# # Power by voltage domain
# report_power -voltage > $REPORTS_DIR/voltage_power.rpt

# # Additional reports for detailed analysis
# report_power -by_hierarchy > $REPORTS_DIR/power_by_hierarchy.rpt
# report_power -by_lib_cell > $REPORTS_DIR/power_by_cell_type.rpt

# # ======== 8. Save Results ========
# # Save power database
# save_power_database $OUTPUTS_DIR/${DESIGN_NAME}_power_analysis.pdb

# # Write power data in various formats
# write_power_data -format spef $OUTPUTS_DIR/${DESIGN_NAME}_power.spef
# write_power_data -format ptpx $OUTPUTS_DIR/${DESIGN_NAME}_power.ptpx

# # ======== 9. Activity Summary Report ========
# echo "==========================================="
# echo "Switching Activity Configuration"
# echo "==========================================="
# echo "Default nets: 50% static prob, 10% toggle rate"
# echo "Clock nets: 50% static prob, 100% toggle rate"
# echo "Reset nets: 10% static prob, 1% toggle rate"
# echo "Data inputs: 50% static prob, 20% toggle rate"
# echo "Control inputs: 20% static prob, 5% toggle rate"
# echo ""

# # ======== 10. Summary Report ========
# echo "==========================================="
# echo "PrimePower Analysis Completed Successfully"
# echo "===========================================" 
# echo "Design: $DESIGN_NAME"
# echo "Technology: SkyWater 130nm"
# echo "Activity Mode: Default (No VCD file)"
# echo "Reports generated in: $REPORTS_DIR"
# echo "Power data saved in: $OUTPUTS_DIR"
# echo ""
# echo "Key Reports:"
# echo "- Detailed Power: power_report_detailed.rpt"
# echo "- Internal Power: internal_power.rpt"
# echo "- Switching Power: switching_power.rpt"
# echo "- Leakage Power: leakage_power.rpt"
# echo "- Clock Network Power: clock_power.rpt"
# echo "- Hierarchical Power: power_by_hierarchy.rpt"
# echo "==========================================="

# # Exit cleanly
# exit