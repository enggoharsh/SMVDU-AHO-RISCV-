# ==========================================================================
# Cadence Genus Synthesis Script - SMVDU-AHO-32 Core-Only (GLS Target)
# Strategy: Synthesize CPU Core, exclude Memories for Hybrid GLS
# ==========================================================================

# --- 1. Setup Search Paths ---
set_db init_lib_search_path {/home/student/ANUPAM/Fresh_GPDK180/ ../Memory_Macros/} 
set_db init_hdl_search_path {../Golden_Design_RTL/}
set_db script_search_path {./} 

# --- 2. Load Technology Libraries ---
# Note: We keep the SRAM library loaded just in case, even though we aren't synthesizing it here.
set_db library {slow.lib sram_32x64_180nm_TT_5p0V_25C.lib} 

# --- 3. Read Design Files ---
read_hdl [glob ../Golden_Design_RTL/*.v]

# --- 4. Elaborate Top Module (CORE ONLY) ---
elaborate Single_Cycle_Core

# --- CRITICAL: Prevention of Logic Pruning & Hierarchy Lock ---
set_db / .boundary_opto false
set_db [get_db modules Single_Cycle_Core] .preserve_hierarchy true

# Explicitly disable automatic ungrouping
set_db / .auto_ungroup none

# Stop Genus from converting unconnected wires into constant 0s
set_db / .hdl_unconnected_value none
set_db / .optimize_constant_0_flops false
set_db / .optimize_constant_feedback_seqs false
set_db / .delete_unloaded_insts false

# --- 5. Apply Constraints ---
# Make sure your constraints.sdc targets the correct pins on Single_Cycle_Core!
read_sdc constraints.sdc 

# --- 6. Synthesis Flow ---
syn_generic
syn_map

# --- 7. Generate Reports ---
report_area > core_area.rpt
report_power > core_power.rpt
report_timing > core_timing.rpt
report_gates > core_gates.rpt

# --- 8. Export Design ---
write_hdl > core_netlist.v
write_sdc > core.sdc

puts "========================================================"
puts " CORE-ONLY SYNTHESIS COMPLETE. READY FOR GLS HYBRID RUN."
puts "========================================================"
exit# ==========================================================================
# Cadence Genus Synthesis Script - SMVDU-AHO-32 Core-Only (GLS Target)
# # Strategy: Synthesize CPU Core, exclude Memories for Hybrid GLS
# # ==========================================================================
#
# # --- 1. Setup Search Paths ---
# set_db init_lib_search_path {/home/student/ANUPAM/Fresh_GPDK180/ ../Memory_Macros/} 
# set_db init_hdl_search_path {../Golden_Design_RTL/}
# set_db script_search_path {./} 
#
# # --- 2. Load Technology Libraries ---
# # Note: We keep the SRAM library loaded just in case, even though we aren't synthesizing it here.
# set_db library {slow.lib sram_32x64_180nm_TT_5p0V_25C.lib} 
#
# # --- 3. Read Design Files ---
# read_hdl [glob ../Golden_Design_RTL/*.v]
#
# # --- 4. Elaborate Top Module (CORE ONLY) ---
# elaborate Single_Cycle_Core
#
# # --- CRITICAL: Prevention of Logic Pruning & Hierarchy Lock ---
# set_db / .boundary_opto false
# set_db [get_db modules Single_Cycle_Core] .preserve_hierarchy true
#
# # Explicitly disable automatic ungrouping
# set_db / .auto_ungroup none
#
# # Stop Genus from converting unconnected wires into constant 0s
# set_db / .hdl_unconnected_value none
# set_db / .optimize_constant_0_flops false
# set_db / .optimize_constant_feedback_seqs false
# set_db / .delete_unloaded_insts false
#
# # --- 5. Apply Constraints ---
# # Make sure your constraints.sdc targets the correct pins on Single_Cycle_Core!
# read_sdc constraints.sdc 
#
# # --- 6. Synthesis Flow ---
# syn_generic
# syn_map
#
# # --- 7. Generate Reports ---
# report_area > core_area.rpt
# report_power > core_power.rpt
# report_timing > core_timing.rpt
# report_gates > core_gates.rpt
#
# # --- 8. Export Design ---
# write_hdl > core_netlist.v
# write_sdc > core.sdc
#
# puts "========================================================"
# puts " CORE-ONLY SYNTHESIS COMPLETE. READY FOR GLS HYBRID RUN."
# puts "========================================================"
# exit# ==========================================================================
# # Cadence Genus Synthesis Script - SMVDU-AHO-32 Core-Only (GLS Target)
# # Strategy: Synthesize CPU Core, exclude Memories for Hybrid GLS
# # ==========================================================================
#
# # --- 1. Setup Search Paths ---
# set_db init_lib_search_path {/home/student/ANUPAM/Fresh_GPDK180/ ../Memory_Macros/} 
# set_db init_hdl_search_path {../Golden_Design_RTL/}
# set_db script_search_path {./} 
#
# # --- 2. Load Technology Libraries ---
# # Note: We keep the SRAM library loaded just in case, even though we aren't synthesizing it here.
# set_db library {slow.lib sram_32x64_180nm_TT_5p0V_25C.lib} 
#
# # --- 3. Read Design Files ---
# read_hdl [glob ../Golden_Design_RTL/*.v]
#
# # --- 4. Elaborate Top Module (CORE ONLY) ---
# elaborate Single_Cycle_Core
#
# # --- CRITICAL: Prevention of Logic Pruning & Hierarchy Lock ---
# set_db / .boundary_opto false
# set_db [get_db modules Single_Cycle_Core] .preserve_hierarchy true
#
# # Explicitly disable automatic ungrouping
# set_db / .auto_ungroup none
#
# # Stop Genus from converting unconnected wires into constant 0s
# set_db / .hdl_unconnected_value none
# set_db / .optimize_constant_0_flops false
# set_db / .optimize_constant_feedback_seqs false
# set_db / .delete_unloaded_insts false
#
# # --- 5. Apply Constraints ---
# # Make sure your constraints.sdc targets the correct pins on Single_Cycle_Core!
# read_sdc constraints.sdc 
#
# # --- 6. Synthesis Flow ---
# syn_generic
# syn_map
#
# # --- 7. Generate Reports ---
# report_area > core_area.rpt
# report_power > core_power.rpt
# report_timing > core_timing.rpt
# report_gates > core_gates.rpt
#
# # --- 8. Export Design ---
# write_hdl > core_netlist.v
# write_sdc > core.sdc
#
# puts "========================================================"
# puts " CORE-ONLY SYNTHESIS COMPLETE. READY FOR GLS HYBRID RUN."
# puts "========================================================"
# exit# ==========================================================================
# # Cadence Genus Synthesis Script - SMVDU-AHO-32 Core-Only (GLS Target)
# # Strategy: Synthesize CPU Core, exclude Memories for Hybrid GLS
# # ==========================================================================
#
# # --- 1. Setup Search Paths ---
# set_db init_lib_search_path {/home/student/ANUPAM/Fresh_GPDK180/ ../Memory_Macros/} 
# set_db init_hdl_search_path {../Golden_Design_RTL/}
# set_db script_search_path {./} 
#
# # --- 2. Load Technology Libraries ---
# # Note: We keep the SRAM library loaded just in case, even though we aren't synthesizing it here.
# set_db library {slow.lib sram_32x64_180nm_TT_5p0V_25C.lib} 
#
# # --- 3. Read Design Files ---
# read_hdl [glob ../Golden_Design_RTL/*.v]
#
# # --- 4. Elaborate Top Module (CORE ONLY) ---
# elaborate Single_Cycle_Core
#
# # --- CRITICAL: Prevention of Logic Pruning & Hierarchy Lock ---
# set_db / .boundary_opto false
# set_db [get_db modules Single_Cycle_Core] .preserve_hierarchy true
#
# # Explicitly disable automatic ungrouping
# set_db / .auto_ungroup none
#
# # Stop Genus from converting unconnected wires into constant 0s
# set_db / .hdl_unconnected_value none
# set_db / .optimize_constant_0_flops false
# set_db / .optimize_constant_feedback_seqs false
# set_db / .delete_unloaded_insts false
#
# # --- 5. Apply Constraints ---
# # Make sure your constraints.sdc targets the correct pins on Single_Cycle_Core!
# read_sdc constraints.sdc 
#
# # --- 6. Synthesis Flow ---
# syn_generic
# syn_map
#
# # --- 7. Generate Reports ---
# report_area > core_area.rpt
# report_power > core_power.rpt
# report_timing > core_timing.rpt
# report_gates > core_gates.rpt
#
# # --- 8. Export Design ---
# write_hdl > core_netlist.v
# write_sdc > core.sdc
#
# puts "========================================================"
# puts " CORE-ONLY SYNTHESIS COMPLETE. READY FOR GLS HYBRID RUN."
# puts "========================================================"
# exit# ==========================================================================
# # Cadence Genus Synthesis Script - SMVDU-AHO-32 Core-Only (GLS Target)
# # Strategy: Synthesize CPU Core, exclude Memories for Hybrid GLS
# # ==========================================================================
#
# # --- 1. Setup Search Paths ---
# set_db init_lib_search_path {/home/student/ANUPAM/Fresh_GPDK180/ ../Memory_Macros/} 
# set_db init_hdl_search_path {../Golden_Design_RTL/}
# set_db script_search_path {./} 
#
# # --- 2. Load Technology Libraries ---
# # Note: We keep the SRAM library loaded just in case, even though we aren't synthesizing it here.
# set_db library {slow.lib sram_32x64_180nm_TT_5p0V_25C.lib} 
#
# # --- 3. Read Design Files ---
# read_hdl [glob ../Golden_Design_RTL/*.v]
#
# # --- 4. Elaborate Top Module (CORE ONLY) ---
# elaborate Single_Cycle_Core
#
# # --- CRITICAL: Prevention of Logic Pruning & Hierarchy Lock ---
# set_db / .boundary_opto false
# set_db [get_db modules Single_Cycle_Core] .preserve_hierarchy true
#
# # Explicitly disable automatic ungrouping
# set_db / .auto_ungroup none
#
# # Stop Genus from converting unconnected wires into constant 0s
# set_db / .hdl_unconnected_value none
# set_db / .optimize_constant_0_flops false
# set_db / .optimize_constant_feedback_seqs false
# set_db / .delete_unloaded_insts false
#
# # --- 5. Apply Constraints ---
# # Make sure your constraints.sdc targets the correct pins on Single_Cycle_Core!
# read_sdc constraints.sdc 
#
# # --- 6. Synthesis Flow ---
# syn_generic
# syn_map
#
# # --- 7. Generate Reports ---
# report_area > core_area.rpt
# report_power > core_power.rpt
# report_timing > core_timing.rpt
# report_gates > core_gates.rpt
#
# # --- 8. Export Design ---
# write_hdl > core_netlist.v
# write_sdc > core.sdc
#
# puts "========================================================"
# puts " CORE-ONLY SYNTHESIS COMPLETE. READY FOR GLS HYBRID RUN."
# puts "========================================================"
# exit# ==========================================================================
# # Cadence Genus Synthesis Script - SMVDU-AHO-32 Core-Only (GLS Target)
# # Strategy: Synthesize CPU Core, exclude Memories for Hybrid GLS
# # ==========================================================================
#
# # --- 1. Setup Search Paths ---
# set_db init_lib_search_path {/home/student/ANUPAM/Fresh_GPDK180/ ../Memory_Macros/} 
# set_db init_hdl_search_path {../Golden_Design_RTL/}
# set_db script_search_path {./} 
#
# # --- 2. Load Technology Libraries ---
# # Note: We keep the SRAM library loaded just in case, even though we aren't synthesizing it here.
# set_db library {slow.lib sram_32x64_180nm_TT_5p0V_25C.lib} 
#
# # --- 3. Read Design Files ---
# read_hdl [glob ../Golden_Design_RTL/*.v]
#
# # --- 4. Elaborate Top Module (CORE ONLY) ---
# elaborate Single_Cycle_Core
#
# # --- CRITICAL: Prevention of Logic Pruning & Hierarchy Lock ---
# set_db / .boundary_opto false
# set_db [get_db modules Single_Cycle_Core] .preserve_hierarchy true
#
# # Explicitly disable automatic ungrouping
# set_db / .auto_ungroup none
#
# # Stop Genus from converting unconnected wires into constant 0s
# set_db / .hdl_unconnected_value none
# set_db / .optimize_constant_0_flops false
# set_db / .optimize_constant_feedback_seqs false
# set_db / .delete_unloaded_insts false
#
# # --- 5. Apply Constraints ---
# # Make sure your constraints.sdc targets the correct pins on Single_Cycle_Core!
# read_sdc constraints.sdc 
#
# # --- 6. Synthesis Flow ---
# syn_generic
# syn_map
#
# # --- 7. Generate Reports ---
# report_area > core_area.rpt
# report_power > core_power.rpt
# report_timing > core_timing.rpt
# report_gates > core_gates.rpt
#
# # --- 8. Export Design ---
# write_hdl > core_netlist.v
# write_sdc > core.sdc
#
# puts "========================================================"
# puts " CORE-ONLY SYNTHESIS COMPLETE. READY FOR GLS HYBRID RUN."
# puts "========================================================"
# exit# ==========================================================================
# # Cadence Genus Synthesis Script - SMVDU-AHO-32 Core-Only (GLS Target)
# # Strategy: Synthesize CPU Core, exclude Memories for Hybrid GLS
# # ==========================================================================
#
# # --- 1. Setup Search Paths ---
# set_db init_lib_search_path {/home/student/ANUPAM/Fresh_GPDK180/ ../Memory_Macros/} 
# set_db init_hdl_search_path {../Golden_Design_RTL/}
# set_db script_search_path {./} 
#
# # --- 2. Load Technology Libraries ---
# # Note: We keep the SRAM library loaded just in case, even though we aren't synthesizing it here.
# set_db library {slow.lib sram_32x64_180nm_TT_5p0V_25C.lib} 
#
# # --- 3. Read Design Files ---
# read_hdl [glob ../Golden_Design_RTL/*.v]
#
# # --- 4. Elaborate Top Module (CORE ONLY) ---
# elaborate Single_Cycle_Core
#
# # --- CRITICAL: Prevention of Logic Pruning & Hierarchy Lock ---
# set_db / .boundary_opto false
# set_db [get_db modules Single_Cycle_Core] .preserve_hierarchy true
#
# # Explicitly disable automatic ungrouping
# set_db / .auto_ungroup none
#
# # Stop Genus from converting unconnected wires into constant 0s
# set_db / .hdl_unconnected_value none
# set_db / .optimize_constant_0_flops false
# set_db / .optimize_constant_feedback_seqs false
# set_db / .delete_unloaded_insts false
#
# # --- 5. Apply Constraints ---
# # Make sure your constraints.sdc targets the correct pins on Single_Cycle_Core!
# read_sdc constraints.sdc 
#
# # --- 6. Synthesis Flow ---
# syn_generic
# syn_map
#
# # --- 7. Generate Reports ---
# report_area > core_area.rpt
# report_power > core_power.rpt
# report_timing > core_timing.rpt
# report_gates > core_gates.rpt
#
# # --- 8. Export Design ---
# write_hdl > core_netlist.v
# write_sdc > core.sdc
#
# puts "========================================================"
# puts " CORE-ONLY SYNTHESIS COMPLETE. READY FOR GLS HYBRID RUN."
# puts "========================================================"
# exit# ==========================================================================
# # Cadence Genus Synthesis Script - SMVDU-AHO-32 Core-Only (GLS Target)
# # Strategy: Synthesize CPU Core, exclude Memories for Hybrid GLS
# # ==========================================================================
#
# # --- 1. Setup Search Paths ---
# set_db init_lib_search_path {/home/student/ANUPAM/Fresh_GPDK180/ ../Memory_Macros/} 
# set_db init_hdl_search_path {../Golden_Design_RTL/}
# set_db script_search_path {./} 
#
# # --- 2. Load Technology Libraries ---
# # Note: We keep the SRAM library loaded just in case, even though we aren't synthesizing it here.
# set_db library {slow.lib sram_32x64_180nm_TT_5p0V_25C.lib} 
#
# # --- 3. Read Design Files ---
# read_hdl [glob ../Golden_Design_RTL/*.v]
#
# # --- 4. Elaborate Top Module (CORE ONLY) ---
# elaborate Single_Cycle_Core
#
# # --- CRITICAL: Prevention of Logic Pruning & Hierarchy Lock ---
# set_db / .boundary_opto false
# set_db [get_db modules Single_Cycle_Core] .preserve_hierarchy true
#
# # Explicitly disable automatic ungrouping
# set_db / .auto_ungroup none
#
# # Stop Genus from converting unconnected wires into constant 0s
# set_db / .hdl_unconnected_value none
# set_db / .optimize_constant_0_flops false
# set_db / .optimize_constant_feedback_seqs false
# set_db / .delete_unloaded_insts false
#
# # --- 5. Apply Constraints ---
# # Make sure your constraints.sdc targets the correct pins on Single_Cycle_Core!
# read_sdc constraints.sdc 
#
# # --- 6. Synthesis Flow ---
# syn_generic
# syn_map
#
# # --- 7. Generate Reports ---
# report_area > core_area.rpt
# report_power > core_power.rpt
# report_timing > core_timing.rpt
# report_gates > core_gates.rpt
#
# # --- 8. Export Design ---
# write_hdl > core_netlist.v
# write_sdc > core.sdc
#
# puts "========================================================"
# puts " CORE-ONLY SYNTHESIS COMPLETE. READY FOR GLS HYBRID RUN."
# puts "========================================================"
# exit
