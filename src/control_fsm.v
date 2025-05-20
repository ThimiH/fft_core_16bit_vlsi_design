module control_fsm #(
    parameter N = 16
)(
    input  wire clk,
    input  wire rst,
    input  wire start,
    output reg [1:0] stage,
    output reg load_inputs,
    output reg compute,
    output reg done,
    output reg read_sel,
    output reg write_sel,
    output reg swap_buffers
);

    localparam STAGES = 4;

    reg [2:0] current_stage;
    reg active;

    always @(posedge clk) begin
        if (rst) begin
            stage <= 0;
            current_stage <= 0;
            load_inputs <= 0;
            compute <= 0;
            done <= 0;
            active <= 0;
            read_sel <= 0;
            write_sel <= 1;
        end
        else if (start && !active) begin
            load_inputs <= 1;
            active <= 1;
        end
        else if (load_inputs) begin
            load_inputs <= 0;
            compute <= 1;
        end
        else if (compute) begin
            compute <= 0;
            current_stage <= current_stage + 1;
            stage <= current_stage;
            swap_buffers <= 1;
        end
        else if (swap_buffers) begin
            swap_buffers <= 0;
            if (current_stage == STAGES) begin
                done <= 1;
                active <= 0;
            end else begin
                compute <= 1;
                read_sel <= ~read_sel;
                write_sel <= ~write_sel;
            end
        end
    end

endmodule
