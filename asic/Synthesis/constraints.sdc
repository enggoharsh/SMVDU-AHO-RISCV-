cat <<EOF > constraints.sdc
# ==========================================================================
# SDC File for SMVDU-AHO-32 Full System (180nm Target)
# Top Module: Single_Cycle_Top
# Target Frequency: 83.3 MHz (Period: 12.0 ns)
# ==========================================================================

create_clock -name sys_clk -period 12.0 -waveform {0 6.0} [get_ports clk]

set_clock_uncertainty -setup 0.5 [get_clocks sys_clk]
set_clock_uncertainty -hold  0.1 [get_clocks sys_clk]
set_clock_transition -rise 0.2 [get_clocks sys_clk]
set_clock_transition -fall 0.2 [get_clocks sys_clk]

# Input Delays (Only reset is an external input now, besides clk)
set_input_delay -max 4.0 -clock sys_clk [get_ports reset]
set_input_delay -min 0.5 -clock sys_clk [get_ports reset]

# Output Delays (Updated to match Single_Cycle_Top ports)
set_output_delay -max 4.0 -clock sys_clk [get_ports MemWrite]
set_output_delay -max 4.0 -clock sys_clk [get_ports {WriteData[*]}]
set_output_delay -max 4.0 -clock sys_clk [get_ports {DataAddr[*]}]
set_output_delay -max 4.0 -clock sys_clk [get_ports {read_dataout[*]}]
set_output_delay -max 4.0 -clock sys_clk [get_ports {PC_out[*]}]
set_output_delay -max 4.0 -clock sys_clk [get_ports {Instr_out[*]}]

set_output_delay -min 0.5 -clock sys_clk [all_outputs]

set_input_transition 0.5 [remove_from_collection [all_inputs] [get_ports clk]]
set_load 0.05 [all_outputs]

set_max_fanout 20 [current_design]
set_max_transition 1.5 [current_design]
EOF
