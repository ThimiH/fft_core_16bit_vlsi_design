// Testbench for fft_stage

module tb_fft_stage;
    parameter N = 8; // FFT size
    parameter STAGE = 0; // Stage number

    reg signed [15:0] xr [0:N-1]; // Input real
    reg signed [15:0] xi [0:N-1]; // Input imag
    wire signed [15:0] out_r [0:N-1]; // Output real
    wire signed [15:0] out_i [0:N-1]; // Output imag

    // Instantiate the fft_stage module
    fft_stage #(
        .N(N),
        .STAGE(STAGE)
    ) uut (
        .xr(xr),
        .xi(xi),
        .out_r(out_r),
        .out_i(out_i)
    );

    initial begin
        // Initialize input data (example data)
        xr[0] = 32767; xi[0] = 0;
        xr[1] = 16384; xi[1] = 16384;
        xr[2] = 0;     xi[2] = 32767;
        xr[3] = -16384;xi[3] = 16384;
        xr[4] = -32767;xi[4] = 0;
        xr[5] = -16384;xi[5] = -16384;
        xr[6] = 0;     xi[6] = -32767;
        xr[7] = 16384; xi[7] = -16384;

        // Wait for the output to stabilize
        #10;

        // Display the output results
        $display("Output Real | Output Imag");
        $display("--------------------------");
        for (integer i = 0; i < N; i = i + 1) begin
            $display("%12d | %12d", out_r[i], out_i[i]);
        end

        $finish;
    end
    initial begin
        $dumpfile("fft_stage.vcd");
        $dumpvars(0, tb_fft_stage);
    end
endmodule
// Note: The testbench initializes the input data for the FFT stage and displays the output results.