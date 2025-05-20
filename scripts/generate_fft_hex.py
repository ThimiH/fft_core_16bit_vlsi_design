import numpy as np
import os

current_dir = os.path.dirname(os.path.abspath(__file__))
home_dir = os.path.dirname(current_dir)
tb_dir = os.path.join(home_dir, "tb")
ip_file = os.path.join(tb_dir, "input_data.hex")
op_file = os.path.join(tb_dir, "expected_output.hex")

N = 16  # FFT size
WIDTH = 16
MAX_VAL = 2**(WIDTH - 1) - 1
MIN_VAL = -2**(WIDTH - 1)

# Generate random signed 16-bit integers
np.random.seed(42)
real = np.random.randint(MIN_VAL, MAX_VAL + 1, N, dtype=np.int16)
imag = np.random.randint(MIN_VAL, MAX_VAL + 1, N, dtype=np.int16)

# Create complex array
input_complex = real + 1j * imag

# Perform FFT
fft_output = np.fft.fft(input_complex)

# Convert FFT result to 16-bit signed integers
fft_real = np.clip(np.round(fft_output.real), MIN_VAL, MAX_VAL).astype(np.int16)
fft_imag = np.clip(np.round(fft_output.imag), MIN_VAL, MAX_VAL).astype(np.int16)

# Helper: write interleaved hex file (real0, imag0, real1, imag1, ...)
def write_interleaved_hex(filename, real_array, imag_array):
    with open(filename, "w") as f:
        for r, im in zip(real_array, imag_array):
            f.write(f"{np.uint16(r):04X}\n")  # Cast to unsigned 16-bit
            f.write(f"{np.uint16(im):04X}\n")  # Cast to unsigned 16-bit

# Write input and expected output in interleaved format
write_interleaved_hex(ip_file, real, imag)
write_interleaved_hex(op_file, fft_real, fft_imag)

print("Generated tb/input_data.hex and tb/expected_output.hex")

