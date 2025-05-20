// Testbench for bit_reversal module
module tb_bit_reversal;
    reg  [3:0] index;                   // Input index
    wire [3:0] reversed;                // Bit-reversed output

    // Instantiate the bit_reversal module
    bit_reversal #(.N(16)) br (
        .index(index),
        .reversed(reversed)
    );

    initial begin
        $display("Index | Reversed");
        $display("-------------------");
        for (index = 0; index < 16; index = index + 1) begin
            #5;
            $display("  %2d   |   %2d", index, reversed);
        end
        $finish;
    end

    initial begin
        $dumpfile("bit_reversal.vcd");
        $dumpvars(0, tb_bit_reversal);
    end

endmodule
// Note: The testbench will print the bit-reversed index for each index from 0 to 15.  