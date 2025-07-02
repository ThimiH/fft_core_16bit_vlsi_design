# === Setup ===
set DESIGN_NAME fft_top
set RTL_PATH ../rtl
set OUTDIR output
set REPORTDIR reports
set LIBDIR ../libs/sky130_fd_sc_hd

# === Read Libraries ===
# Load technology library (.db)
set target_library "$LIBDIR/sky130_fd_sc_hd__tt_025C_1v80.db"
set link_library "* $target_library"

# (Optional) Load .lib if needed for certain reports
# read_lib $LIBDIR/sky130_fd_sc_hd__tt_025C_1v80.lib  # Commented out - Library Compiler not available

# === Read RTL ===
# Read all module files first (dependencies)
read_verilog $RTL_PATH/modules/butterfly.v
read_verilog $RTL_PATH/modules/fft_ctrl_sm.v
read_verilog $RTL_PATH/modules/mem_32x16.v
read_verilog $RTL_PATH/modules/read_addr_lut.v
read_verilog $RTL_PATH/modules/w_lut.v

# Read top-level module last
read_verilog $RTL_PATH/fft_top.v

# === Set Top Module ===
current_design $DESIGN_NAME

# === Link Design ===
# Verify all references are resolved
link
if { [check_design] != 0 } {
    echo "Error: Design has unresolved references or other issues"
    exit 1
}

# === Create Clock ===
create_clock -period 10 [get_ports clk]   ;# 100 MHz

# === Set Output Load ===
# set_load 0.05 [all_outputs]            ;# Optional

# === Compile Design ===
compile_ultra

# === Write Outputs ===
# Create output directory if it doesn't exist
file mkdir $OUTDIR
file mkdir $REPORTDIR

write -format verilog -hierarchy -output $OUTDIR/${DESIGN_NAME}_synth.v
write_sdc $OUTDIR/${DESIGN_NAME}.sdc

# === Reports ===
report_area      > $REPORTDIR/area.rpt
report_timing    > $REPORTDIR/timing.rpt
report_qor       > $REPORTDIR/qor.rpt
report_cells     > $REPORTDIR/cells.rpt
report_resources > $REPORTDIR/resources.rpt
