if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name macro_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/sram_32x64_180nm_TT_5p0V_25C.lib\
    ${::IMEX::libVar}/mmmc/Single_Cycle_Core.lib]
create_timing_condition -name typical_cond\
   -library_sets [list macro_libs]
create_rc_corner -name typical_rc\
   -pre_route_res 1\
   -post_route_res 1\
   -pre_route_cap 1\
   -post_route_cap 1\
   -post_route_cross_cap 1\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0
create_delay_corner -name typical_delay\
   -rc_corner typical_rc
create_constraint_mode -name typical_constraints\
   -sdc_files\
    [list /dev/null]
create_analysis_view -name typical_view -constraint_mode typical_constraints -delay_corner typical_delay
set_analysis_view -setup [list typical_view] -hold [list typical_view]
