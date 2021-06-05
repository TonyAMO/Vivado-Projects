# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7k70tfbv676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/HP Useer/Desktop/Lab3_ALU_Naylor_Ojeda/Lab4_Datapath/Lab4_Datapath.cache/wt} [current_project]
set_property parent.project_path {C:/Users/HP Useer/Desktop/Lab3_ALU_Naylor_Ojeda/Lab4_Datapath/Lab4_Datapath.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  {C:/Users/HP Useer/Desktop/Lab3_ALU_Naylor_Ojeda/Lab4_Datapath/Lab4_Datapath.srcs/sources_1/new/PCADD.v}
  {C:/Users/HP Useer/Desktop/Lab3_ALU_Naylor_Ojeda/Lab4_Datapath/Lab4_Datapath.srcs/sources_1/new/PC.v}
  {C:/Users/HP Useer/Desktop/Lab3_ALU_Naylor_Ojeda/Lab4_Datapath/Lab4_Datapath.srcs/sources_1/imports/new/ALU.v}
  {C:/Users/HP Useer/Desktop/Lab3_ALU_Naylor_Ojeda/Lab4_Datapath/Lab4_Datapath.srcs/sources_1/new/control.v}
  {C:/Users/HP Useer/Desktop/Lab3_ALU_Naylor_Ojeda/Lab4_Datapath/Lab4_Datapath.srcs/sources_1/imports/Downloads/regfile32.v}
  {C:/Users/HP Useer/Desktop/Lab3_ALU_Naylor_Ojeda/Lab4_Datapath/Lab4_Datapath.srcs/sources_1/imports/Downloads/Instruction_Memory.v}
  {C:/Users/HP Useer/Desktop/Lab3_ALU_Naylor_Ojeda/Lab4_Datapath/Lab4_Datapath.srcs/sources_1/new/Datapath.v}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top Datapath -part xc7k70tfbv676-1


write_checkpoint -force -noxdef Datapath.dcp

catch { report_utilization -file Datapath_utilization_synth.rpt -pb Datapath_utilization_synth.pb }