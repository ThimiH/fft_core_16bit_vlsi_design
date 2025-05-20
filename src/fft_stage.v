module fft_stage #(
    parameter N = 8,                      // FFT size
    parameter STAGE = 0                   // Stage number (0 to log2(N)-1)
)(
    input  wire signed [15:0] xr [0:N-1], // Input real
    input  wire signed [15:0] xi [0:N-1], // Input imag
    output wire signed [15:0] out_r [0:N-1], // Output real
    output wire signed [15:0] out_i [0:N-1]  // Output imag
);

    localparam NUM_BF = N >> 1;  // Number of butterflies in this stage
    integer i;

    wire signed [15:0] wr, wi;
    wire signed [15:0] ar, ai, br, bi;

    genvar g;
    generate
        for (g = 0; g < NUM_BF; g = g + 1) begin : stage_butterflies

            wire signed [15:0] x0r = xr[g];
            wire signed [15:0] x0i = xi[g];
            wire signed [15:0] x1r = xr[g + NUM_BF];
            wire signed [15:0] x1i = xi[g + NUM_BF];

            wire signed [15:0] wr, wi;
            twiddle_rom tw (
                .index(g << STAGE),
                .wr(wr),
                .wi(wi)
            );

            butterfly_unit bf (
                .xr(x0r), .xi(x0i),
                .yr(x1r), .yi(x1i),
                .wr(wr),  .wi(wi),
                .ar(out_r[g]),   .ai(out_i[g]),
                .br(out_r[g + NUM_BF]), .bi(out_i[g + NUM_BF])
            );

        end
    endgenerate
endmodule

// Note: The butterfly_unit module performs the butterfly operation for the FFT.
// The twiddle_rom module provides the twiddle factors for the FFT.
// The fft_stage module combines these components to perform one stage of the FFT.
// The output of the fft_stage module is the result of the FFT stage.
// The twiddle factors are derived from the complex exponential function e^(-2*pi*i*k/N)
// The output format is:
// Index | wr     | wi
// -------------------------
