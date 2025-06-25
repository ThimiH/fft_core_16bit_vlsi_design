set DESIGN_NAME fft_top
set RTL_PATH ../../rtl
set OUTDIR ../output
set REPORTDIR ../reports

# Read files
read_verilog $RTL_PATH/fft_top.v
# Add all submodules if not included
read_verilog $RTL_PATH/modules/*.v

# Set top
current_design $DESIGN_NAME

# Set constraints
# (clock, input/output delays, etc.)
create_clock -period 10 [get_ports clk]

# Synthesize
compile -map_effort high

# Write outputs
write -format verilog -hierarchy -output $OUTDIR/${DESIGN_NAME}_synth.v
write_sdc $OUTDIR/${DESIGN_NAME}.sdc

# Reports
report_area > $REPORTDIR/area.rpt
report_timing > $REPORTDIR/timing.rpt
report_qor > $REPORTDIR/qor.rpt
