#project name and boards
create_project -force lab2 . -part xq7z020cl400-2I

#set the language of project
set_property target_language Verilog [current_project]

#add files to project
import_files -norecurse {./file1.v ./file2.v}
update_compile_order -fileset sources_1

#add constraint files to project
import_files -fileset constrs_1 -norecurse {./uart_led_pins_Zybo.xdc ./uart_led_timing_Zybo.xdc}

reset_run synth_1
launch_runs synth_1

launch_runs impl_1

launch_runs impl_1 -to_step write_bitstream
