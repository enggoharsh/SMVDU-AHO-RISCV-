/*
select SRCB for the alu for generation of necessary 
data / address to read/write something on data memory as well as 
to generate offset
*/

`timescale 1ns / 1ps


module ALU_Mux (
		input wire [31:0]  WD, ImmExt,
		input wire	   ALUSrc,
		output wire [31:0] B
		);

   assign B = ALUSrc ? ImmExt : WD;

endmodule
