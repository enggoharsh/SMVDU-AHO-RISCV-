# ==========================================================================
# Cadence Genus Synthesis Script - SMVDU-AHO-32 Full System (Fixed)
# Strategy: Root-level Boundary Protection, Anti-Pruning & Hierarchy Lock
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
elaborate Single_Cycle_Top 

# --- CRITICAL: Prevention of Logic Pruning & Flattening ---
set_db / .boundary_opto false
set_db [get_db modules Single_Cycle_Top] .preserve_hierarchy true

# NEW FIX: Explicitly disable automatic ungrouping to keep Memory Modules visible
set_db / .auto_ungroup none

# NEW FIX: Stop Genus from converting memory into constant 0s
set_db / .hdl_unconnected_value none
set_db / .optimize_constant_0_flops false
set_db / .optimize_constant_feedback_seqs false
set_db / .delete_unloaded_insts false

# --- 5. Apply Constraints ---
read_sdc constraints.sdc 

# --- 6. Synthesis Flow ---
syn_generic
syn_map

# --- 7. Generate Reports ---
report_area > full_system_area.rpt
report_power > full_system_power.rpt
report_timing > full_system_timing.rpt
report_gates > full_system_gates.rpt

# --- 8. Export Design ---
write_hdl > full_system_netlist.v
write_sdc > full_system.sdc

puts "========================================================"
puts " FULL SYSTEM SYNTHESIS COMPLETE. HIERARCHY PRESERVED.  "
puts "========================================================"
exit
