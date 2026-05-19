`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2026 10:48:38
// Design Name: 
// Module Name: Single_Cycle_FPGA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Single_Cycle_FPGA(
			input 	      clk,reset,
			/*output [31:0] WriteData,DataAddr,*/
			output 	      MemWrite,
			output [3:0] pc_out, instr_out, rd_out );

   wire [31:0] PC, Instr, ReadData, WriteData, DataAddr;
    wire clkS;
    
    clk125_to_1hz clk1 (
                     .clk(clk),
                     .rst(reset),
                     .clk_1hz(clkS)
                     );
                     
                    
   Single_Cycle_Core core_top (
			       .clk(clkS),
			       .reset(reset),
			       .Instr(Instr),
			       .ReadData(ReadData),
			       .PC(PC),
			       .MemWrite(MemWrite),
			       .ALUResult(DataAddr),
			       .WriteData(WriteData) );

   Instruction_Memory Instr_Memory ( 
				     .A(PC),
				     .RD(Instr) );

   Data_Memory Data_Memory (
			    .clk(clkS), 
			    .WE(MemWrite),
			    .A(DataAddr), 
			    .WD(WriteData),
			    .RD(ReadData) );
    assign pc_out = PC[3:0];
    assign instr_out = Instr[3:0];
    assign rd_out = ReadData[3:0];
endmodule

