module fft_core_top #(
    parameter N = 16
)(
    input  wire clk,
    input  wire rst,
    input  wire start,
    input  wire signed [15:0] in_real [0:N-1],
    input  wire signed [15:0] in_imag [0:N-1],
    output wire done,
    output wire signed [15:0] out_real [0:N-1],
    output wire signed [15:0] out_imag [0:N-1]
);

    localparam STAGES = 4;  // log2(16) = 4

    reg [15:0] buffer0_real [0:N-1];
    reg [15:0] buffer0_imag [0:N-1];
    reg [15:0] buffer1_real [0:N-1];
    reg [15:0] buffer1_imag [0:N-1];

    wire [1:0] read_sel, write_sel;
    wire [1:0] stage;
    wire load_inputs, compute, swap_buffers;

    reg [15:0] fft_in_real [0:N-1];
    reg [15:0] fft_in_imag [0:N-1];
    wire [15:0] fft_out_real [0:N-1];
    wire [15:0] fft_out_imag [0:N-1];

    // FSM Controller
    control_fsm #(.N(N)) fsm (
        .clk(clk),
        .rst(rst),
        .start(start),
        .stage(stage),
        .load_inputs(load_inputs),
        .compute(compute),
        .done(done),
        .read_sel(read_sel),
        .write_sel(write_sel),
        .swap_buffers(swap_buffers)
    );

    // FFT Stage
    fft_stage #(.N(N)) stage_unit (
        .xr(fft_in_real),
        .xi(fft_in_imag),
        .stage(stage),
        .out_r(fft_out_real),
        .out_i(fft_out_imag)
    );

    integer i;
    always @(posedge clk) begin
        if (rst) begin
            // Clear everything
            for (i = 0; i < N; i = i + 1) begin
                buffer0_real[i] <= 0;
                buffer0_imag[i] <= 0;
                buffer1_real[i] <= 0;
                buffer1_imag[i] <= 0;
            end
        end
        else if (load_inputs) begin
            // Load input samples into buffer0
            for (i = 0; i < N; i = i + 1) begin
                buffer0_real[i] <= in_real[i];
                buffer0_imag[i] <= in_imag[i];
            end
        end
        else if (compute) begin
            // Copy buffer to FFT stage inputs
            if (read_sel == 0) begin
                fft_in_real = buffer0_real;
                fft_in_imag = buffer0_imag;
            end else begin
                fft_in_real = buffer1_real;
                fft_in_imag = buffer1_imag;
            end

            // Store FFT outputs into write buffer
            for (i = 0; i < N; i = i + 1) begin
                if (write_sel == 0) begin
                    buffer0_real[i] <= fft_out_real[i];
                    buffer0_imag[i] <= fft_out_imag[i];
                end else begin
                    buffer1_real[i] <= fft_out_real[i];
                    buffer1_imag[i] <= fft_out_imag[i];
                end
            end
        end
    end

    // Output result from the last used buffer
    assign out_real = (read_sel == 0) ? buffer1_real : buffer0_real;
    assign out_imag = (read_sel == 0) ? buffer1_imag : buffer0_imag;

endmodule
// Note: The fft_core_top module orchestrates the FFT process, including loading inputs,
//       performing the FFT computation, and managing the output buffers.
//       The control_fsm module handles the state machine for controlling the FFT process.
//       The fft_stage module performs the FFT computation for each stage.
//       The output format is:
//       Index | Real Part | Imaginary Part
