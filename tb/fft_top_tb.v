`timescale 1ns / 1ps

// Created by:  Thimira Hirushan
// Date:        2025-06-05
// Project:     16-bit FFT module
// Module:      testbench for fft_top (overall FFT module)
// Description: This testbench verifies the functionality of the fft_top module.

module fft_top_tb;

    
    // Signals
    
    reg                clk;
    reg                reset;

    reg                in_push;
    reg signed [15:0]  in_real;
    reg signed [15:0]  in_imag;
    wire               in_stall;

    wire               out_push;
    wire signed [15:0] out_real;
    wire signed [15:0] out_imag;
    reg                out_stall;

    integer            i;
    integer            r;

    
    // Generate Clock Signals
    
    // 250 MHz clock
    initial clk = 1'b1;
    always #2 clk = ~clk;

    // Instantiate Modules
    
    fft_top fft_top_0 (
        .clk        (clk),
        .reset      (reset),
        .in_push    (in_push),
        .in_real    (in_real),
        .in_imag    (in_imag),
        .in_stall   (in_stall),
        .out_push_F (out_push),
        .out_real_F (out_real),
        .out_imag_F (out_imag),
        .out_stall  (out_stall)
    );

    
    // Apply Stimulus
    
    // Record the input data.
    initial begin: RECORD_INPUT

        integer input_file;
        integer count;
	
	count = 0;

        input_file = $fopen("tb/data/data_in.txt", "w");

        $fdisplay(input_file, "Testing...");
        $fdisplay(input_file, "Testing...");

        while (count < 16) begin

            @(posedge clk);

            if (in_push === 1'b1 && in_stall === 1'b0) begin

                $display("in(%0d) = %0d + i*%0d;",
                count + 1, in_real, in_imag);

                $fdisplay(input_file, "in(%0d) = %0d + i*%0d;",
                count + 1, in_real, in_imag);

                count = count + 1;

            end

        end

    end

    // Record the output data.
    initial begin: RECORD_OUTPUT

        integer output_file;
        integer count;
        integer j;

	count = 0;

        output_file = $fopen("tb/data/data_out.txt", "w");

        while (count < 16) begin

            @(posedge clk);

            if (out_push === 1'b1 && out_stall === 1'b0) begin

                $display("out(%0d) = %0d + i*%0d;",
                count + 1, out_real, out_imag);

                $fwrite(output_file, "out(%0d) = %0d + i*%0d;\n",
                count + 1, out_real, out_imag);

                count = count + 1;

            end

        end

    end

    // Apply stimulus.
    initial begin

        repeat (1) @(posedge clk);

        reset = 1'b1;
        repeat (1) @(posedge clk);

        reset = 1'b0;
        in_push = 1'b0;
        in_real = 0;
        in_imag = 0;
        out_stall = 0;
        repeat (1) @(posedge clk);

        for (i = 0; i < 16; i = i+1) begin

            in_push = 1'b1;

            // Activate one case at a time by commenting out the others.

            // // Case (i)
            // in_real = (i == 0)? 16'h7fff : 0;
            // in_imag = 0;

            // Case (ii)
            in_real = (i == 1)? 16'h7fff : 0;
            in_imag = 0;

            // // Case (iii)
            // in_real = (i <= 5 || i >= 11)? 16'h7fff : 0;
            // in_imag = 0;

            // // Case (iv)
            // r = $random(r);
            // in_real = r[15:0];
            // r = $random(r);
            // in_imag = r[15:0];

            repeat (1) @(posedge clk);

        end

        in_push = 1'b0;
        repeat (1) @(posedge clk);

        for (i = 0; i < 16; i = i+1) begin

            while (out_push == 1'b0)
                @(posedge clk);

            //$display("%04x %04x (%0d %0d)", out_real, out_imag, out_real, out_imag);
            @(posedge clk);

        end

        repeat (5) @(posedge clk);

        $finish;

    end

endmodule
