module butterfly_unit (
    input  signed [15:0] xr, xi,     // Input x = xr + j*xi
    input  signed [15:0] yr, yi,     // Input y = yr + j*yi
    input  signed [15:0] wr, wi,     // Twiddle factor w = wr + j*wi
    output signed [15:0] ar, ai,     // Output a = x + w*y
    output signed [15:0] br, bi      // Output b = x - w*y
);

    // Intermediate signals
    wire signed [31:0] w_mul_yr_r = wr * yr;
    wire signed [31:0] w_mul_yi_i = wi * yi;
    wire signed [31:0] w_mul_yr_i = wr * yi;
    wire signed [31:0] w_mul_yi_r = wi * yr;

    // Fixed-point complex multiplication (w * y)
    wire signed [15:0] wy_r = (w_mul_yr_r - w_mul_yi_i) >>> 15;
    wire signed [15:0] wy_i = (w_mul_yr_i + w_mul_yi_r) >>> 15;

    // Output a = x + w*y
    assign ar = xr + wy_r;
    assign ai = xi + wy_i;

    // Output b = x - w*y
    assign br = xr - wy_r;
    assign bi = xi - wy_i;

endmodule