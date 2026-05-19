`timescale 1ns / 1ps


module Data_Memory(
		   input wire 	      clk, WE,
		   input wire [31:0]  A, WD,
		   output wire [31:0] RD
		   );

   reg [31:0] 			      RAM[63:0];

   assign RD = RAM[A[31:2]]; // word aligned


initial begin
   RAM[32'h00_00_00_00]  = 32'h88992343;
   RAM[1]  = 32'h00000002; 
   RAM[2]  = 32'h00000003; 
   RAM[3]  = 32'h56FFDDAA;
   RAM[63] = 32'h14321432;  
end

/*
initial
    begin
        $readmemh ("ram.hex", RAM);
    end
*/


   always @(posedge clk)
     if (WE)
       RAM[A[31:2]] <= WD;

endmodule
