# ==============================================================================
# LEGACY INNOVUS INITIALIZATION SCRIPT (V3)
# ==============================================================================

# Define the physical libraries (LEF)
# -> CHANGED: Now using the true 180nm combined LEF file!
set init_lef_file {/home/install/FOUNDRY/digital/180nm/dig/lef/all.lef ./inputs/sram_32x64_180nm.lef}

# Define the MMMC setup file
set init_mmmc_file "./scripts/mmmc.tcl"

# Define the synthesized netlist
set init_verilog "./inputs/core_dft_netlist.v"

# Set the top module name
set init_top_cell "Single_Cycle_Core"

# Define power and ground nets
set init_pwr_net "VDD"
set init_gnd_net "VSS"

# Initialize the design database
init_design

# Read the scan chain definitions (Legacy command)
defIn ./inputs/core_scan.scandef

puts "--- Legacy Initialization Complete ---"
