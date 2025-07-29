# =========[ ICC2 Physical Design Script ]=========
# Created by: Thimira Hirushan
# Date: 2025-07-04
# Project: FFT Core 16-bit VLSI Design
# Description: ICC2 script for place and route of synthesized FFT design

# ======== Setup and Library Configuration ========
set DESIGN_NAME "fft_top"
set NETLIST_DIR "../netlists"
# Update this path to point to the cloned library
set TECH_DIR "../libs/skywater-pdk-main/libraries/sky130_fd_sc_hd"
set REPORTS_DIR "./reports"
set OUTPUTS_DIR "./outputs"

# Create output directories
file mkdir $REPORTS_DIR
file mkdir $OUTPUTS_DIR

# Set search paths
set_app_var search_path ". $TECH_DIR $NETLIST_DIR"

# ======== 1. Library Setup ========
# Create a new library first (without reference libraries)
create_lib -technology $TECH_DIR/latest/tech/sky130_fd_sc_hd.tf ${DESIGN_NAME}_lib

# Set the created library as current
current_lib ${DESIGN_NAME}_lib

# Create a block first before reading LEF/LIB files
if {[sizeof_collection [get_blocks -quiet $DESIGN_NAME]] > 0} {
    remove_block $DESIGN_NAME
    puts "Removed existing block: $DESIGN_NAME"
}
create_block $DESIGN_NAME
current_design $DESIGN_NAME

# Now read technology LEF file
read_tech_lef $TECH_DIR/latest/techlef/sky130_fd_sc_hd.lef

# Read Liberty timing library
read_lib $TECH_DIR/latest/timing/sky130_fd_sc_hd__tt_025C_1v80.lib

# Set target and link libraries for better consistency
set_lib_cell_purpose -include optimization [get_lib_cells]

# Set timing derate if needed
set_timing_derate -early 0.95 -late 1.05

# ======== 2. Design Import ========
read_verilog $NETLIST_DIR/fft_netlist.v

# Fix library linking - set reference libraries properly
set_ref_libs -add $TECH_DIR/sky130_fd_sc_hd__tt_025C_1v80.lib

link_design

# Add missing constraint import BEFORE floorplanning
read_sdc $NETLIST_DIR/fft_constraints.sdc

# ======== 3. Floorplanning ========
# Initialize floorplan with aspect ratio and utilization
initialize_floorplan \
    -core_utilization 0.7 \
    -core_aspect_ratio 1.0 \
    -left_io2core 10.0 \
    -bottom_io2core 10.0 \
    -right_io2core 10.0 \
    -top_io2core 10.0

# Create power domains (if needed)
# create_power_domain PD_TOP

# ======== 4. Pin Assignment ========
# Auto pin assignment
set_pin_constraints -self
place_pins -self

# ======== 5. Power Planning ========
# Connect power/ground ports first
connect_pg_net -net VDD [get_ports VDD]
connect_pg_net -net VSS [get_ports VSS]

# Create power/ground rings
create_pg_ring_pattern ring_pattern \
    -horizontal_layer M3 \
    -horizontal_width 2.0 \
    -horizontal_spacing 2.0 \
    -vertical_layer M2 \
    -vertical_width 2.0 \
    -vertical_spacing 2.0

set_pg_strategy core_ring \
    -pattern {{name: ring_pattern} {nets: {VDD VSS}}} \
    -core -extension {{stop: outermost_ring}}

compile_pg -strategies core_ring

# Standard cell power connections
connect_pg_net -automatic

# ======== 6. Placement ========
# Standard cell placement
place_opt

# Report placement
report_placement -physical_hierarchy > $REPORTS_DIR/placement.rpt

# ======== 7. Clock Tree Synthesis ========
# Clock constraints already read in step 2
# read_sdc $NETLIST_DIR/fft_constraints.sdc  # REMOVE THIS LINE

# CTS
clock_opt

# Report clock tree
report_clock_tree -summary > $REPORTS_DIR/clock_tree.rpt
report_timing -delay_type max > $REPORTS_DIR/timing_post_cts.rpt

# ======== 8. Routing ========
# Global routing
route_global

# Check global routing quality
report_global_route > $REPORTS_DIR/global_route.rpt

# Detail routing
route_detail

# Post-route optimization and cleanup
route_opt -incremental -size_only

# ======== 9. Post-Route Optimization ========
# Final optimization
route_opt

# ======== 10. Filler Cell Insertion ========
# Add filler cells
create_stdcell_filler \
    -lib_cells [get_lib_cells "*/sky130_fd_sc_hd__fill_*"] \
    -prefix FILLER

# ======== 11. Final Verification ========
# Design rule check
check_design -checks all

# Timing verification
update_timing
report_timing -delay_type max -max_paths 10 > $REPORTS_DIR/final_timing_max.rpt
report_timing -delay_type min -max_paths 10 > $REPORTS_DIR/final_timing_min.rpt

# Power analysis
report_power > $REPORTS_DIR/final_power.rpt

# Area report
report_area > $REPORTS_DIR/final_area.rpt

# Congestion analysis
report_congestion > $REPORTS_DIR/congestion.rpt

# ======== 12. Output Generation ========
# Write final database
save_block -as ${DESIGN_NAME}_final

# Write DEF
write_def $OUTPUTS_DIR/${DESIGN_NAME}_final.def

# Write GDS (if stream layers are defined)
write_gds $OUTPUTS_DIR/${DESIGN_NAME}_final.gds

# Write netlists
# Write netlistsUTPUTS_DIR/${DESIGN_NAME}_final.v
write_verilog $OUTPUTS_DIR/${DESIGN_NAME}_final.v
# Write SDF for timing simulation
# Write SDF for timing simulationAME}_final.sdf
write_sdf $OUTPUTS_DIR/${DESIGN_NAME}_final.sdf
# Write SDC constraints
# Write SDC constraints${DESIGN_NAME}_final.sdc
write_sdc $OUTPUTS_DIR/${DESIGN_NAME}_final.sdc
# Write parasitics
# Write parasiticsformat SPEF $OUTPUTS_DIR/${DESIGN_NAME}_final.spef
write_parasitics -format SPEF $OUTPUTS_DIR/${DESIGN_NAME}_final.spef
# ======== 13. Final Reports ========
# ======== 13. Final Reports ========
# Summary report$REPORTS_DIR/design_summary.rpt
report_design > $REPORTS_DIR/design_summary.rpt
echo "ICC2 flow completed successfully!"
echo "ICC2 flow completed successfully!"
echo "Check reports in: $REPORTS_DIR"
echo "Check outputs in: $OUTPUTS_DIR"
# Save and exit
# Save and exit
save_block# exit