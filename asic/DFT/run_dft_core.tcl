# ==========================================================================
# Updated Cadence Genus DFT Synthesis Script - SMVDU-AHO-32 Core
# ==========================================================================

# --- 1. Setup Search Paths ---
set_db init_lib_search_path {/home/student/ANUPAM/Fresh_GPDK180/ ../Memory_Macros/}
set_db init_hdl_search_path {../Golden_Design_RTL/}
set_db script_search_path {./}

# --- 2. Load Technology Libraries ---
set_db library {slow.lib sram_32x64_180nm_TT_5p0V_25C.lib}

# --- 3. Read Design Files ---
read_hdl [glob ../Golden_Design_RTL/*.v]

# --- 4. Elaborate Top Module ---
elaborate Single_Cycle_Core

# --- 5. Apply Constraints ---
read_sdc constraints.sdc

# --- 6. DFT Setup (Pre-Synthesis) ---
set_db / .dft_scan_style muxed_scan
define_shift_enable -name SE -active high -create_port SE -default
set_db / .use_scan_seqs_for_non_dft false

# --- 7. Synthesis Flow ---
syn_generic
syn_map
syn_opt

# --- 8. DFT Insertion (Post-Mapping) ---
set_db [get_db designs *] .dft_min_number_of_scan_chains 1
define_scan_chain -name top_chain -sdi scan_in -sdo scan_out -create_ports
check_dft_rules
convert_to_scan
connect_scan_chains -auto_create_chains

# --- 9. Generate Reports ---
report_scan_chains > core_dft_chains.rpt
report_area > core_dft_area.rpt
report_timing > core_dft_timing.rpt

# --- 10. Export DFT Netlist and Physical Data ---
write_hdl > core_dft_netlist.v
write_sdc > core_dft.sdc
# ADDED: Write the SCANDEF file for Innovus Placement
write_scandef > core_scan.scandef

puts "========================================================"
puts " DFT INSERTION COMPLETE. SCANDEF GENERATED."
puts "========================================================"
exit
