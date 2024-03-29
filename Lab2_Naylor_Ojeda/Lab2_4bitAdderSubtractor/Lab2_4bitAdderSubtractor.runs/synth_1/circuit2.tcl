# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7k70tfbv676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/HP Useer/Lab2_4bitAdderSubtractor/Lab2_4bitAdderSubtractor.cache/wt} [current_project]
set_property parent.project_path {C:/Users/HP Useer/Lab2_4bitAdderSubtractor/Lab2_4bitAdderSubtractor.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {{C:/Users/HP Useer/Lab2_4bitAdderSubtractor/Lab2_4bitAdderSubtractor.srcs/sources_1/new/circuit2.v}}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top circuit2 -part xc7k70tfbv676-1


write_checkpoint -force -noxdef circuit2.dcp

catch { report_utilization -file circuit2_utilization_synth.rpt -pb circuit2_utilization_synth.pb }
