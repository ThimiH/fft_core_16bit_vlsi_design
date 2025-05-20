module twiddle_rom (
    input  [3:0] index,                  // 0 to 15
    output reg signed [15:0] wr, wi     // Real and Imaginary parts
);

    always @(*) begin
        case (index)
            4'd0:  begin wr =  32767; wi =     0; end
            4'd1:  begin wr =  30273; wi = 12539; end
            4'd2:  begin wr =  23170; wi = 23170; end
            4'd3:  begin wr =  12539; wi = 30273; end
            4'd4:  begin wr =      0; wi = 32767; end
            4'd5:  begin wr = -12539; wi = 30273; end
            4'd6:  begin wr = -23170; wi = 23170; end
            4'd7:  begin wr = -30273; wi = 12539; end
            4'd8:  begin wr = -32767; wi =     0; end
            4'd9:  begin wr = -30273; wi = -12539; end
            4'd10: begin wr = -23170; wi = -23170; end
            4'd11: begin wr = -12539; wi = -30273; end
            4'd12: begin wr =      0; wi = -32767; end
            4'd13: begin wr =  12539; wi = -30273; end
            4'd14: begin wr =  23170; wi = -23170; end
            4'd15: begin wr =  30273; wi = -12539; end
            default: begin wr = 0; wi = 0; end
        endcase
    end
endmodule

// Note: The values for wr and wi are scaled by 2^15 to fit in 16 bits.
// The twiddle factors are derived from the complex exponential function e^(-2*pi*i*k/N)