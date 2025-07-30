# =========[ ICC2 Physical Design Script ]=========
# Created by: Thimira Hirushan
# Date: 2025-07-04
# Project: FFT Core 16-bit VLSI Design
# Description: ICC2 script for place and route of synthesized FFT design

# ======== Setup and Library Configuration ========
set DESIGN_NAME "fft_top"
set NETLIST_DIR "../netlists"
# Update this path to point to the cloned library
set TECH_DIR "../libs/sky130_library"
set REPORTS_DIR "./reports"
set OUTPUTS_DIR "./outputs"

# Create output directories
file mkdir $REPORTS_DIR
file mkdir $OUTPUTS_DIR

# Set search paths
set_app_var search_path ". $TECH_DIR $NETLIST_DIR"

# ======== 1. Library Setup ========
# Create a new library first (without reference libraries)
create_lib -technology $TECH_DIR/skywater130_fd_sc_hd.tf ${DESIGN_NAME}_lib

# Save the created library
save_lib ${DESIGN_NAME}_lib

# Set the created library as current
current_lib ${DESIGN_NAME}_lib

# Step 8
# Set reference libraries
set_ref_libs -ref_libs $TECH_DIR/ndm/sky130_fd_sc_hd.ndm


# Step 9
# Derive the design
derive_design_level_via_regions

# Step 10
# Read the verilog file
read_verilog $NETLIST_DIR/fft_netlist.v

# Step 11
# Read constraints file (SDC)
read_sdc $NETLIST_DIR/fft_constraints.sdc

# Step 12 - Alternative with aspect ratio control
# Initialize the floorplan
initialize_floorplan \
    -core_utilization 0.7 \
    -side_ratio 1.0 \
    -core_offset "10.0 10.0 10.0 10.0"

create_pg_ring_pattern ring_pattern \
    -horizontal_layer met3 \
    -horizontal_width 2.0 \
    -horizontal_spacing 2.0 \
    -vertical_layer met2 \
    -vertical_width 2.0 \
    -vertical_spacing 2.0

# Step 13
# read parasitics
read_parasitic_tech -tlup $TECH_DIR/skywater130.nominal.tluplus -layermap $TECH_DIR/skywater130.mw2itf.map
set_parasitic_parameters -late_spec $TECH_DIR/skywater130.nominal.tluplus

# Step 14
# Place the design
place_opt

# Step 15
# Route the design
route_auto

# # Step 16
# # Clock tree synthesis
# clock_opt

# # Step 17
# # Post-route optimization
# route_opt

# # Step 18
# # Add filler cells
# create_stdcell_filler \
#     -lib_cells [get_lib_cells "*/sky130_fd_sc_hd__fill_*"] \
#     -prefix FILLER

# # Step 19
# # Final design rule check
# check_design -checks all

# Step 20
# Update timing for final analysis
update_timing

# Step 21
# Generate reports
report_timing -delay_type max -max_paths 10 > $REPORTS_DIR/final_timing_max.rpt
report_timing -delay_type min -max_paths 10 > $REPORTS_DIR/final_timing_min.rpt
report_power > $REPORTS_DIR/final_power.rpt
# report_area > $REPORTS_DIR/final_area.rpt
report_congestion > $REPORTS_DIR/congestion.rpt
report_design > $REPORTS_DIR/design_summary.rpt

# Step 22
# Save final design
save_block -as ${DESIGN_NAME}_final

# Step 23
# Write output files
write_def $OUTPUTS_DIR/${DESIGN_NAME}_final.def
write_verilog $OUTPUTS_DIR/${DESIGN_NAME}_final.v
write_sdf $OUTPUTS_DIR/${DESIGN_NAME}_final.sdf
write_sdc -output $OUTPUTS_DIR/${DESIGN_NAME}_final.sdc
write_parasitics -output $OUTPUTS_DIR/${DESIGN_NAME}_final.spef

# Step 24
# Optional: Write GDS if stream layers are available
write_gds $OUTPUTS_DIR/${DESIGN_NAME}_final.gds

# Step 25
# Final summary
echo "ICC2 flow completed successfully!"
echo "Check reports in: $REPORTS_DIR"
echo "Check outputs in: $OUTPUTS_DIR"

# Save and exit
save_lib ${DESIGN_NAME}_lib
exit