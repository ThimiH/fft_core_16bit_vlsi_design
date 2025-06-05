`timescale 1ns / 1ps

// Created by:  Thimira Hirushan
// Date:        2025-06-05
// Project:     16-bit FFT module
// Module:      LUT for read addresses according to stage and butterfly index
// Description: This module implements a Look-Up Table (LUT) for the read addresses used in FFTs.
//              It provides the addresses for A, B, and W based on the stage and butterfly index.

module read_addr_lut (
        input wire [1:0] stage,
        input wire [2:0] butterfly,
        output reg [3:0] A_addr,
        output reg [3:0] B_addr,
        output reg [2:0] W_addr
    );

    always @(*) begin

        case (stage)

            0: begin
                case (butterfly)
                    0:  A_addr = 0;     B_addr = 8;     W_addr = 0;
                    1:  A_addr = 4;     B_addr = 12;    W_addr = 0;
                    2:  A_addr = 2;     B_addr = 10;    W_addr = 0;
                    3:  A_addr = 6;     B_addr = 14;    W_addr = 0;
                    4:  A_addr = 1;     B_addr = 9;     W_addr = 0;
                    5:  A_addr = 5;     B_addr = 13;    W_addr = 0;
                    6:  A_addr = 3;     B_addr = 11;    W_addr = 0;
                    7:  A_addr = 7;     B_addr = 15;    W_addr = 0;
                endcase
            end // case: 0

            1: begin
                case (butterfly)
                    0:  A_addr = 0;     B_addr = 4;     W_addr = 0;
                    1:  A_addr = 8;     B_addr = 12;    W_addr = 4;
                    2:  A_addr = 2;     B_addr = 6;     W_addr = 0;
                    3:  A_addr = 10;    B_addr = 14;    W_addr = 4;
                    4:  A_addr = 1;     B_addr = 5;     W_addr = 0;
                    5:  A_addr = 9;     B_addr = 13;    W_addr = 4;
                    6:  A_addr = 3;     B_addr = 7;     W_addr = 0;
                    7:  A_addr = 11;    B_addr = 15;    W_addr = 4;
                endcase
            end // case: 1

            2: begin
                case (butterfly)
                    0:  A_addr = 0;     B_addr = 2;     W_addr = 0;
                    1:  A_addr = 8;     B_addr = 10;    W_addr = 2;
                    2:  A_addr = 4;     B_addr = 6;     W_addr = 4;
                    3:  A_addr = 12;    B_addr = 14;    W_addr = 6;
                    4:  A_addr = 1;     B_addr = 3;     W_addr = 0;
                    5:  A_addr = 9;     B_addr = 11;    W_addr = 2;
                    6:  A_addr = 5;     B_addr = 7;     W_addr = 4;
                    7:  A_addr = 13;    B_addr = 15;    W_addr = 6;
                endcase
            end // case: 2

            3: begin
                case (butterfly)
                    0:  A_addr = 0;     B_addr = 1;     W_addr = 0;
                    1:  A_addr = 8;     B_addr = 9;     W_addr = 1;
                    2:  A_addr = 4;     B_addr = 5;     W_addr = 2;
                    3:  A_addr = 12;    B_addr = 13;    W_addr = 3;
                    4:  A_addr = 2;     B_addr = 3;     W_addr = 4;
                    5:  A_addr = 10;    B_addr = 11;    W_addr = 5;
                    6:  A_addr = 6;     B_addr = 7;     W_addr = 6;
                    7:  A_addr = 14;    B_addr = 15;    W_addr = 7;
                endcase
            end // case: 3

        endcase

    end

endmodule