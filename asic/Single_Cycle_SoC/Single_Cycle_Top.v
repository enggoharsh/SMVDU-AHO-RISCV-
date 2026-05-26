`timescale 1ns / 1ps

module Single_Cycle_Top(
    input         clk, reset,
    output [31:0] WriteData_SoC, DataAddr_SoC,
    output        MemWrite_SoC,
    output [31:0] read_dataout_SoC,
    output [31:0] PC_out_SoC,
    output [31:0] Instr_out_SoC
);
   wire [31:0] PC, Instr, ReadData, WriteData_int, DataAddr_int;
   wire        MemWrite_int;
   
   // 1. CPU Core
   Single_Cycle_Core core_top (
       .clk(clk), .reset(reset), .Instr(Instr),
       .ReadData(ReadData), .PC(PC), .MemWrite(MemWrite_int),
       .ALUResult(DataAddr_int), .WriteData(WriteData_int)
   );
   
   // 2. SRAM Macro - Direct connection to satisfy the strict parser
   sram_32x64_180nm data_sram (
       .clk0(clk), 
       .csb0(1'b0),            
       .web0(MemWrite_int),    // Direct wire connection
       .addr0(DataAddr_int[5:0]),
       .din0(WriteData_int), 
       .dout0(ReadData)
   );
   
   // 3. Boundary assignments
   assign WriteData_SoC = WriteData_int;
   assign DataAddr_SoC  = DataAddr_int;
   assign MemWrite_SoC  = MemWrite_int;
   assign read_dataout_SoC = ReadData;
   assign PC_out_SoC = PC;
   assign Instr_out_SoC = Instr;
endmodule
