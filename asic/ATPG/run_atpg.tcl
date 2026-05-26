# ==========================================================================
# Cadence Modus ATPG Script - SMVDU-AHO-32 Core
# ==========================================================================

# 1. Read the physical logic models (Modus uses the Verilog simulation models)
read_library /home/student/ANUPAM/Fresh_GPDK180/slow_vdd1v0_basicCells.v
read_library ../Memory_Macros/sram_32x64_180nm_TT_5p0V_25C.v
read_library ../GLS/patch.v

# 2. Read your synthesized DFT netlist
read_netlist ../DFT/core_dft_netlist.v

# 3. Build the architectural test model of your CPU
build_testmodel -root Single_Cycle_Core

# 4. Build the Fault Model (Targeting standard Stuck-At faults)
build_faultmodel -type stuck

# 5. The Main Event: Generate Test Patterns (ATPG)
create_tests

# 6. Generate Coverage Reports
report_faults > atpg_coverage.rpt
report_statistics > atpg_stats.rpt

# 7. Export the test vectors for the ATE (Automated Test Equipment)
# STIL (Standard Test Interface Language) is the industry standard format
write_vectors -format stil > core_test_patterns.stil

puts "========================================================"
puts " ATPG COMPLETE. PATTERNS GENERATED."
puts "========================================================"
exit
