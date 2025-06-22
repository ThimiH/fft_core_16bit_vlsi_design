`timescale 1ns / 1ps

// Created by:  Thimira Hirushan
// Date:        2025-06-05
// Project:     16-bit FFT module
// Module:      LUT for W
// Description: This module implements a Look-Up Table (LUT) for the W values used in FFTs.

module w_lut (
        input wire [2:0] addr,
        output reg [31:0] W
    );

    always @(*) begin

        case (addr)
            0: W = {16'd16384, 16'd0};
            1: W = {16'd15137, -16'd6270};
            2: W = {16'd11585, -16'd11585};
            3: W = {16'd6270, -16'd15137};
            4: W = {16'd0, -16'd16384};
            5: W = {-16'd6270, -16'd15137};
            6: W = {-16'd11585, -16'd11585};
            7: W = {-16'd15137, -16'd6270};
        endcase

    end

endmodule