`timescale 1ns/1ps

module tb_fft_core;

    parameter N = 16;
    parameter WIDTH = 16;

    reg clk, rst, start;
    reg signed [WIDTH-1:0] in_real [0:N-1];
    reg signed [WIDTH-1:0] in_imag [0:N-1];

    wire done;
    wire signed [WIDTH-1:0] out_real [0:N-1];
    wire signed [WIDTH-1:0] out_imag [0:N-1];

    reg signed [WIDTH-1:0] expected_real [0:N-1];
    reg signed [WIDTH-1:0] expected_imag [0:N-1];

    integer i, err_count;

    // Instantiate the FFT core
    fft_core_top #(.N(N)) uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .in_real(in_real),
        .in_imag(in_imag),
        .done(done),
        .out_real(out_real),
        .out_imag(out_imag)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 100 MHz

    initial begin
        // Reset
        rst = 1; start = 0;
        #20;
        rst = 0;

        // Load input vectors
        $readmemh("tb/input_data.hex", in_real, 0, N-1);
        $readmemh("tb/input_data.hex", in_imag, N, 2*N-1);

        // Load expected output
        $readmemh("tb/expected_output.hex", expected_real, 0, N-1);
        $readmemh("tb/expected_output.hex", expected_imag, N, 2*N-1);

        // Start the FFT
        #10;
        start = 1;
        #10;
        start = 0;

        // Wait for done
        wait (done);
        #20;

        // Compare outputs
        err_count = 0;
        for (i = 0; i < N; i = i + 1) begin
            if (out_real[i] !== expected_real[i] || out_imag[i] !== expected_imag[i]) begin
                $display("Mismatch at index %0d: Got (%0d, %0d), Expected (%0d, %0d)",
                    i, out_real[i], out_imag[i], expected_real[i], expected_imag[i]);
                err_count = err_count + 1;
            end
        end

        if (err_count == 0)
            $display("FFT Test PASSED!");
        else
            $display("FFT Test FAILED with %0d errors.", err_count);

        $finish;
    end

endmodule
