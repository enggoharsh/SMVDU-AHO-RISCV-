// 1. Setup log file
set log file core_lec.log -replace

// 2. Read the TSMC 180nm standard cells AND patches for BOTH designs
read library /home/student/ANUPAM/Fresh_GPDK180/slow_vdd1v0_basicCells.v ../GLS/patch.v -verilog -both

// 3. Read your RTL files as the Golden reference
read design ../Golden_Design_RTL/*.v -verilog -golden
set root module Single_Cycle_Core -golden

// 4. Read your Genus core netlist as the Revised design
read design ../Synthesis/core_netlist.v -verilog -revised
set root module Single_Cycle_Core -revised

// 5. Switch to verification mode and mathematically compare
set system mode lec
add compare point -all
compare
report compare data
