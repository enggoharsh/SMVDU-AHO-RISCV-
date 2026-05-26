`timescale 1ns / 1ps

module Single_Cycle_Top(
    input         clk, reset,
    // Data Interface
    output [31:0] WriteData, DataAddr,
    output        MemWrite,
    output [31:0] read_dataout,
    // Instruction/Debug Interface (Crucial for Synthesis visibility)
    output [31:0] PC_out,       // Expose PC to avoid logic pruning
    output [31:0] Instr_out     // Expose Instr to ensure memory is synthesized
);

   wire [31:0]    PC, Instr, ReadData;

   // Boundary assignments to preserve internal logic[cite: 4]
   assign read_dataout = ReadData;
   assign PC_out       = PC;
   assign Instr_out    = Instr;

   // Main CPU Core[cite: 5]
   Single_Cycle_Core core_top (
       .clk(clk),
       .reset(reset),
       .Instr(Instr),
       .ReadData(ReadData),
       .PC(PC),
       .MemWrite(MemWrite),
       .ALUResult(DataAddr),
       .WriteData(WriteData) 
   );

   // ROM/Instruction Storage[cite: 4]
   Instruction_Memory Instr_Memory ( 
       .A(PC),
       .RD(Instr) 
   );

   // RAM/Data Storage[cite: 4]
   Data_Memory Data_Memory (
       .clk(clk), 
       .WE(MemWrite),
       .A(DataAddr), 
       .WD(WriteData),
       .RD(ReadData) 
   );

endmodule
