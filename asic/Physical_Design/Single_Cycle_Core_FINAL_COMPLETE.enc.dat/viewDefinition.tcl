if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name std_set_slow\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow.lib\
    ${::IMEX::libVar}/mmmc/sram_32x64_180nm_TT_5p0V_25C.lib]
create_rc_corner -name rc_typ\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0
create_delay_corner -name corner_slow\
   -library_set std_set_slow\
   -rc_corner rc_typ
create_constraint_mode -name func_mode\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/core_dft.sdc]
create_analysis_view -name view_hold -constraint_mode func_mode -delay_corner corner_slow
create_analysis_view -name view_setup -constraint_mode func_mode -delay_corner corner_slow
set_analysis_view -setup [list view_setup] -hold [list view_setup]
