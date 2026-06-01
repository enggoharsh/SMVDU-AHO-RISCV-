module CLKBUFXL (input A, output Y); assign Y = A; endmodule
module BUFX1 (input A, output Y); assign Y = A; endmodule
// Patch for missing AFHCONX2 Full Adder cell
module AFHCONX2 (A, B, CI, S, CON);
  input A, B, CI;
  output S, CON;
  
  assign S = A ^ B ^ CI;
  assign CON = (A & B) | (B & CI) | (CI & A);
endmodule

// Patch for missing AFHCINX2 Full Adder cell
module AFHCINX2 (A, B, CIN, S, CO);
  input A, B, CIN;
  output S, CO;
  
  assign S = A ^ B ^ CIN;
  assign CO = (A & B) | (B & CIN) | (CIN & A);
endmodule
