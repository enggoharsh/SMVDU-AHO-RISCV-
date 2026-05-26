create_library_set -name std_set_slow -timing {./inputs/slow.lib ./inputs/sram_32x64_180nm_TT_5p0V_25C.lib}
create_rc_corner -name rc_typ -temperature 25
create_delay_corner -name corner_slow -library_set std_set_slow -rc_corner rc_typ
create_constraint_mode -name func_mode -sdc_files {./inputs/core_dft.sdc}
create_analysis_view -name view_setup -constraint_mode func_mode -delay_corner corner_slow
create_analysis_view -name view_hold  -constraint_mode func_mode -delay_corner corner_slow
set_analysis_view -setup {view_setup} -hold {view_hold}
puts "--- MMMC Safe-Mode Setup Complete ---"
