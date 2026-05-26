(globals version = 3 io_order = default)
(iopad
    (top (pin name="clk") (pin name="reset"))
    (bottom (pin name="MemWrite_SoC"))
    (left (pin name="DataAddr_SoC[31:0]") (pin name="PC_out_SoC[31:0]"))
    (right (pin name="WriteData_SoC[31:0]") (pin name="read_dataout_SoC[31:0]") (pin name="Instr_out_SoC[31:0]"))
)
