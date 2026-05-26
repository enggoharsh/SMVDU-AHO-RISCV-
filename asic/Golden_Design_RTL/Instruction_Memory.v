`timescale 1ns / 1ps

module Instruction_Memory(
			  input [31:0] 	A,
			  output [31:0] RD
			  );
   //hardcoding an instruction memory for the following instructions:
   //Address Instruction Type Fields Machine Language - Sarah Harris TBK Pg.399
   //0x1000 L7: lw x6, -4(x9) I 111111111100 01001 010 00110 0000011 FFC4A303
   //imm11:0 rs1 f3 rd op
   //0x1004 sw x6, 8(x9) S 0000000 00110 01001 010 01000 0100011 0064A423
   //imm11:5 rs2 rs1 f3 imm4:0 op
   //0x1008 or x4, x5, x6 R 0000000 00110 00101 110 00100 0110011 0062E233
   //funct7 rs2 rs1 f3 rd op
   //0x100C beq x4, x4, L7 B 1111111 00100 00100 000 10101 1100011 FE420AE3
   reg [31:0] 				I_MEM_BLOCK[63:0];

   initial
     begin
	  /* I_MEM_BLOCK[0]  = 32'h00100093; 
       I_MEM_BLOCK[1]  = 32'h01000113; 
       I_MEM_BLOCK[2]  = 32'hffd00193; 
       I_MEM_BLOCK[3]  = 32'h00000213; 
       I_MEM_BLOCK[4]  = 32'h00c18293; 
       I_MEM_BLOCK[5]  = 32'h00211313; 
       I_MEM_BLOCK[6]  = 32'hff012393; 
       I_MEM_BLOCK[7]  = 32'hff013413; 
       I_MEM_BLOCK[8]  = 32'h01214493; 
       I_MEM_BLOCK[9]  = 32'h0031d513; 
       I_MEM_BLOCK[10] = 32'h4031d593; 
       I_MEM_BLOCK[11] = 32'h0031e613; 
       I_MEM_BLOCK[12] = 32'h0031f693; 
       I_MEM_BLOCK[13] = 32'h00110733; 
       I_MEM_BLOCK[14] = 32'h401107b3; 
       I_MEM_BLOCK[15] = 32'h00111833; 
       I_MEM_BLOCK[16] = 32'h003128b3; 
       I_MEM_BLOCK[17] = 32'h00313933; 
       I_MEM_BLOCK[18] = 32'h001149b3; 
       I_MEM_BLOCK[19] = 32'h00115a33; 
       I_MEM_BLOCK[20] = 32'h40115ab3; 
       I_MEM_BLOCK[21] = 32'h00116b33; 
       I_MEM_BLOCK[22] = 32'h00117bb3; 
       I_MEM_BLOCK[23] = 32'h02000c37; 
       I_MEM_BLOCK[24] = 32'h02000c97; 
       I_MEM_BLOCK[25] = 32'h001108a3; 
       I_MEM_BLOCK[26] = 32'h00311b23; 
       I_MEM_BLOCK[27] = 32'h00212c23; 
       I_MEM_BLOCK[28] = 32'h02418d03; 
       I_MEM_BLOCK[29] = 32'h02919d83; 
       I_MEM_BLOCK[30] = 32'h02b1ae03; 
       I_MEM_BLOCK[31] = 32'h0241ce83; 
       I_MEM_BLOCK[32] = 32'h0291df03; 
       I_MEM_BLOCK[33] = 32'h00000213; 
       I_MEM_BLOCK[34] = 32'hffb00313; 
       I_MEM_BLOCK[35] = 32'h00500393; 
       I_MEM_BLOCK[36] = 32'h00120213; 
       I_MEM_BLOCK[37] = 32'h00130313; 
       I_MEM_BLOCK[38] = 32'hfe734ce3; 
       I_MEM_BLOCK[39] = 32'h00600333; 
       I_MEM_BLOCK[40] = 32'h00000213; 
       I_MEM_BLOCK[41] = 32'hffb00413; 
       I_MEM_BLOCK[42] = 32'h00500493; 
       I_MEM_BLOCK[43] = 32'h00120213; 
       I_MEM_BLOCK[44] = 32'hfff48493; 
       I_MEM_BLOCK[45] = 32'hfe84dce3; 
       I_MEM_BLOCK[46] = 32'h009004b3; 
       I_MEM_BLOCK[47] = 32'h00000213; 
       I_MEM_BLOCK[48] = 32'h00100513; 
       I_MEM_BLOCK[49] = 32'h00500593; 
       I_MEM_BLOCK[50] = 32'h00120213; 
       I_MEM_BLOCK[51] = 32'h00150513; 
       I_MEM_BLOCK[52] = 32'hfeb56ce3; 
       I_MEM_BLOCK[53] = 32'h00a00533; 
       I_MEM_BLOCK[54] = 32'h00000213; 
       I_MEM_BLOCK[55] = 32'h00100613; 
       I_MEM_BLOCK[56] = 32'h00500693; 
       I_MEM_BLOCK[57] = 32'h00120213; 
       I_MEM_BLOCK[58] = 32'hfff68693; 
       I_MEM_BLOCK[59] = 32'hfec6fce3; 
       I_MEM_BLOCK[60] = 32'h00d006b3; 
       I_MEM_BLOCK[61] = 32'h00000213; 
       I_MEM_BLOCK[62] = 32'h00500713; 
       I_MEM_BLOCK[63] = 32'h00000793; 
       I_MEM_BLOCK[64] = 32'h00120213; 
       I_MEM_BLOCK[65] = 32'h00178793; 
       I_MEM_BLOCK[66] = 32'hfee79ce3; 
       I_MEM_BLOCK[67] = 32'h00f007b3; 
       I_MEM_BLOCK[68] = 32'h00000213; 
       I_MEM_BLOCK[69] = 32'h00200813; 
       I_MEM_BLOCK[70] = 32'h00300893; 
       I_MEM_BLOCK[71] = 32'h00120213; 
       I_MEM_BLOCK[72] = 32'h00180813; 
       I_MEM_BLOCK[73] = 32'hff180ce3; 
       I_MEM_BLOCK[74] = 32'h01000833; 
       I_MEM_BLOCK[75] = 32'h13400fe7; 
       I_MEM_BLOCK[76] = 32'hfff00213; 
       I_MEM_BLOCK[77] = 32'h01f00fb3; 
       I_MEM_BLOCK[78] = 32'h0000026f; 
       */
       I_MEM_BLOCK[0]  = 32'h00500113;
       I_MEM_BLOCK[1]  = 32'h00C00193;
       I_MEM_BLOCK[2]  = 32'hFF718393;
       I_MEM_BLOCK[3]  = 32'h0023E233;
       I_MEM_BLOCK[4]  = 32'h0041F2B3;
       I_MEM_BLOCK[5]  = 32'h004282B3;
       I_MEM_BLOCK[6]  = 32'h02728863;
       I_MEM_BLOCK[7]  = 32'h0041A233;
       I_MEM_BLOCK[8]  = 32'h00020463;
       I_MEM_BLOCK[9]  = 32'h00000293;
       I_MEM_BLOCK[10] = 32'h0023A233;
       I_MEM_BLOCK[11] = 32'h005203B3;
       I_MEM_BLOCK[12] = 32'h402383B3;
       I_MEM_BLOCK[13] = 32'h0471AA23;
       I_MEM_BLOCK[14] = 32'h06002103;
       I_MEM_BLOCK[15] = 32'h005104B3;
       I_MEM_BLOCK[16] = 32'h008001EF;
       I_MEM_BLOCK[17] = 32'h00100113;
       I_MEM_BLOCK[18] = 32'h00910133;
       I_MEM_BLOCK[19] = 32'h0221A023;
       I_MEM_BLOCK[20] = 32'h00210063;
     end

   assign RD = I_MEM_BLOCK[A[31:2]]; // word aligned

endmodule
