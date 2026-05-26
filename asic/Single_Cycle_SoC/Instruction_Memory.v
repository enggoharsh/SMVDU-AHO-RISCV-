`timescale 1ns / 1ps

module Instruction_Memory(
    input  [31:0] A,
    output [31:0] RD
);
    // Structural assignment instead of a behavioral always block
    assign RD = 32'h00000000;

endmodule
