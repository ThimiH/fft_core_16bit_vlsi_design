// Testbench for butterfly_unit
module butterfly_unit_tb;

    reg signed [15:0] xr, xi, yr, yi, wr, wi;
    wire signed [15:0] ar, ai, br, bi;

    // Instantiate the butterfly unit
    butterfly_unit uut (
        .xr(xr), .xi(xi),
        .yr(yr), .yi(yi),
        .wr(wr), .wi(wi),
        .ar(ar), .ai(ai),
        .br(br), .bi(bi)
    );

    initial begin
        // Test case 1
        xr = 16'h0001; xi = 16'h0002;
        yr = 16'h0003; yi = 16'h0004;
        wr = 16'h0005; wi = 16'h0006;
        #10;

        // Test case 2
        xr = 16'h0007; xi = 16'h0008;
        yr = 16'h0009; yi = 16'h000A;
        wr = 16'h000B; wi = 16'h000C;
        #10;

        // Add more test cases as needed

        $finish;
    end

    initial begin
        $monitor("Time: %0t | xr: %h, xi: %h | yr: %h, yi: %h | wr: %h, wi: %h | ar: %h, ai: %h | br: %h, bi: %h",
                 $time, xr, xi, yr, yi, wr, wi, ar, ai, br, bi);
    end

endmodule
// Note: The testbench will print the values of xr, xi, yr, yi, wr, wi, ar, ai, br, and bi at each time step.