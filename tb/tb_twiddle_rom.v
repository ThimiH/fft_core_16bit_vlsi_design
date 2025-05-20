module tb_twiddle_rom;
    reg  [3:0] index;
    wire signed [15:0] wr, wi;

    // Instantiate the ROM
    twiddle_rom rom (
        .index(index),
        .wr(wr),
        .wi(wi)
    );

    initial begin
        $display("Index | wr     | wi");
        $display("-------------------------");
        for (index = 0; index < 16; index = index + 1) begin
            #5;
            $display("  %2d   | %6d | %6d", index, wr, wi);
        end
        $finish;
    end
endmodule

// Note: The testbench will print the values of wr and wi for each index from 0 to 15.
// The expected output will show the twiddle factors for the FFT algorithm.
// The values are scaled by 2^15 to fit in 16 bits.
// The twiddle factors are derived from the complex exponential function e^(-2*pi*i*k/N)
// The output format is:
// Index | wr     | wi
// -------------------------