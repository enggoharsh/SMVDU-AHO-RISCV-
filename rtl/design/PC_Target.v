/*
add extended value from Imm. Ext. 
for various jump and branching instruction
when PCSrc = 1;

*/


`timescale 1ns / 1ps

module PC_Target(
		 input wire [31:0]  PC,ImmExt,
		 output wire [31:0] PCTarget
		 );

   assign PCTarget= PC + ImmExt;

endmodule
