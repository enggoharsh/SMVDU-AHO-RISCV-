// 1. Setup log file
set log file dft_lec.log -replace

// 2. Read the REAL definitions from the .lib files first
read library /home/student/ANUPAM/Fresh_GPDK180/slow.lib ../Memory_Macros/sram_32x64_180nm_TT_5p0V_25C.lib -liberty -both

// 3. APPEND the Verilog simulation models and patches
read library /home/student/ANUPAM/Fresh_GPDK180/slow_vdd1v0_basicCells.v ../GLS/patch.v -verilog -both -append

// 4. Read PRE-DFT Netlist as Golden reference
read design ../Synthesis/core_netlist.v -verilog -golden
set root module Single_Cycle_Core -golden

// 5. Read POST-DFT Netlist as Revised design
read design ../DFT/core_dft_netlist.v -verilog -revised
set root module Single_Cycle_Core -revised

// 6. CRITICAL DFT CONSTRAINT: Tie Scan Enable to 0
add pin constraint 0 SE -revised

// 7. Switch to verification mode and compare
set system mode lec
add compare point -all
compare

// 8. Report final results
report compare data
