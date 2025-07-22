# Prime Time Script for FFT Core 16-bit VLSI Design
# Generated on July 22, 2025

# Set up library path
set search_path [list . ../libs/sky130_fd_sc_hd]

# Load timing libraries
set target_library sky130_fd_sc_hd__tt_025C_1v80.db
set link_library [list * $target_library]

# Read the netlist
read_verilog ../netlists/fft_netlist.v

# Set current design
current_design fft_top

# Link the design
link_design

# Read SDF file for back-annotation (if available)
if {[file exists ../netlists/fft.sdf]} {
    read_sdf ../netlists/fft.sdf
}

# Read constraints
read_sdc ../netlists/fft_constraints.sdc

# Update timing
update_timing

# Create reports directory
file mkdir reports

# Part I: Generate the requested timing reports

# 1. Basic timing report
report_timing > reports/timing_report.rpt

# 2. Timing report with delay type min and max
report_timing -delay_type min > reports/timing_report_min.rpt
report_timing -delay_type max > reports/timing_report_max.rpt

# 3. Timing report with path type summary
report_timing -path_type summary > reports/timing_path_summary.rpt

# 4. Clock report
report_clock > reports/clock_report.rpt

# 5. Clock tree report
report_clock_tree > reports/clock_tree_report.rpt

# Part II: Generate Slack and Violation Reports

# Check timing violations
check_timing > reports/check_timing.rpt

# Report all violators
report_constraint -all_violators > reports/constraint_violations.rpt

# Report timing summary
report_timing -path_type summary -slack_only > reports/timing_slack_summary.rpt

# Report setup violations
report_timing -delay_type max -max_paths 20 -slack_lesser_than 0.0 > reports/setup_violations.rpt

# Report hold violations  
report_timing -delay_type min -max_paths 20 -slack_lesser_than 0.0 > reports/hold_violations.rpt

# Report clock skew
report_clock -skew > reports/clock_skew.rpt

# Report design statistics
report_design > reports/design_stats.rpt

# Report area
report_area > reports/area_report.rpt

# Report power
report_power > reports/power_report.rpt

# Additional detailed timing analysis
report_timing -delay_type max -max_paths 10 -input_pins > reports/critical_paths_detailed.rpt

# Generate QoR summary
report_qor > reports/qor_summary.rpt

puts "Prime Time analysis completed successfully!"
puts "Reports generated in reports/ directory"

# exit
