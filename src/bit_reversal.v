module bit_reversal #(
    parameter N = 16                    // FFT size
)(
    input  [$clog2(N)-1:0] index,       // Input index
    output reg [$clog2(N)-1:0] reversed // Bit-reversed output
);

    integer i;
    always @(*) begin
        reversed = 0;
        for (i = 0; i < $clog2(N); i = i + 1) begin
            reversed[i] = index[$clog2(N)-1 - i];
        end
    end
endmodule 