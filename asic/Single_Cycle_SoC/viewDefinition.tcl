create_library_set -name macro_libs -timing {sram_32x64_180nm_TT_5p0V_25C.lib Single_Cycle_Core.lib}
create_rc_corner -name typical_rc
create_delay_corner -name typical_delay -library_set macro_libs -rc_corner typical_rc
create_constraint_mode -name typical_constraints -sdc_files {dummy.sdc}
create_analysis_view -name typical_view -constraint_mode typical_constraints -delay_corner typical_delay
set_analysis_view -setup {typical_view} -hold {typical_view}
