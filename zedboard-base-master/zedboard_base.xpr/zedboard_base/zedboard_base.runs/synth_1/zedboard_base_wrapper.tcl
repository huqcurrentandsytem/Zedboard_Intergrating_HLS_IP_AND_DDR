# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.cache/wt [current_project]
set_property parent.project_path /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property ip_repo_paths {
  /home/tingyuan/Documents/zedboard-base-master/Vivado/ip_repo/ddr_test1_1.0
  /home/tingyuan/Documents/zedboard-base-master/Vivado/ip_repo/bandwidth_test_1.0
  /home/tingyuan/Temporary/vivado-outputs
} [current_project]
set_property ip_output_repo /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/hdl/zedboard_base_wrapper.v
add_files /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/zedboard_base.bd
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_processing_system7_0_0/zedboard_base_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_ddr_hls_test_0_0/constraints/ddr_hls_test_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_10/bd_777a_s01a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_16/bd_777a_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_17/bd_777a_m00arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_18/bd_777a_m00rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_19/bd_777a_m00awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_20/bd_777a_m00wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_21/bd_777a_m00bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_11/bd_777a_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_12/bd_777a_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_13/bd_777a_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_14/bd_777a_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_15/bd_777a_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_2/bd_777a_arsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_3/bd_777a_rsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_4/bd_777a_awsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_5/bd_777a_wsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_6/bd_777a_bsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_1/bd_777a_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_smc_0/bd_0/ip/ip_1/bd_777a_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_rst_ps7_0_100M_0/zedboard_base_rst_ps7_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_rst_ps7_0_100M_0/zedboard_base_rst_ps7_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_rst_ps7_0_100M_0/zedboard_base_rst_ps7_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_timer_0_0/zedboard_base_axi_timer_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_axi_timer_0_0/zedboard_base_axi_timer_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_xbar_0/zedboard_base_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/ip/zedboard_base_auto_pc_0/zedboard_base_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/tingyuan/Documents/zedboard-base-master/Vivado/zedboard_base/zedboard_base.srcs/sources_1/bd/zedboard_base/zedboard_base_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top zedboard_base_wrapper -part xc7z020clg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef zedboard_base_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file zedboard_base_wrapper_utilization_synth.rpt -pb zedboard_base_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
