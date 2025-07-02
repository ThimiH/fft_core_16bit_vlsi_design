# Test script to check if RTL files can be read
# === Setup ===
set DESIGN_NAME fft_top
set RTL_PATH ../rtl
set LIBDIR ../libs/sky130_fd_sc_hd

# === Read Libraries ===
set target_library "$LIBDIR/sky130_fd_sc_hd__tt_025C_1v80.db"
set link_library "* $target_library"

# === Read RTL ===
echo "Reading butterfly.v..."
read_verilog $RTL_PATH/modules/butterfly.v

echo "Reading fft_ctrl_sm.v..."
read_verilog $RTL_PATH/modules/fft_ctrl_sm.v

echo "Reading mem_32x16.v..."
read_verilog $RTL_PATH/modules/mem_32x16.v

echo "Reading read_addr_lut.v..."
read_verilog $RTL_PATH/modules/read_addr_lut.v

echo "Reading w_lut.v..."
read_verilog $RTL_PATH/modules/w_lut.v

echo "Reading fft_top.v..."
read_verilog $RTL_PATH/fft_top.v

# === Set Top Module ===
current_design $DESIGN_NAME

# === Link Design ===
echo "Linking design..."
link

echo "Checking design..."
check_design

echo "Test completed successfully!"
