// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Wed Aug 15 02:56:01 2018
// Host        : tingyuan-OptiPlex-9010 running 64-bit Ubuntu 18.04 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ zedboard_base_ddr_hls_test_0_0_stub.v
// Design      : zedboard_base_ddr_hls_test_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ddr_hls_test,Vivado 2018.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_BUS_A_AWADDR, s_axi_BUS_A_AWVALID, 
  s_axi_BUS_A_AWREADY, s_axi_BUS_A_WDATA, s_axi_BUS_A_WSTRB, s_axi_BUS_A_WVALID, 
  s_axi_BUS_A_WREADY, s_axi_BUS_A_BRESP, s_axi_BUS_A_BVALID, s_axi_BUS_A_BREADY, 
  s_axi_BUS_A_ARADDR, s_axi_BUS_A_ARVALID, s_axi_BUS_A_ARREADY, s_axi_BUS_A_RDATA, 
  s_axi_BUS_A_RRESP, s_axi_BUS_A_RVALID, s_axi_BUS_A_RREADY, ap_clk, ap_rst_n, interrupt, 
  m_axi_gmem_AWADDR, m_axi_gmem_AWLEN, m_axi_gmem_AWSIZE, m_axi_gmem_AWBURST, 
  m_axi_gmem_AWLOCK, m_axi_gmem_AWREGION, m_axi_gmem_AWCACHE, m_axi_gmem_AWPROT, 
  m_axi_gmem_AWQOS, m_axi_gmem_AWVALID, m_axi_gmem_AWREADY, m_axi_gmem_WDATA, 
  m_axi_gmem_WSTRB, m_axi_gmem_WLAST, m_axi_gmem_WVALID, m_axi_gmem_WREADY, 
  m_axi_gmem_BRESP, m_axi_gmem_BVALID, m_axi_gmem_BREADY, m_axi_gmem_ARADDR, 
  m_axi_gmem_ARLEN, m_axi_gmem_ARSIZE, m_axi_gmem_ARBURST, m_axi_gmem_ARLOCK, 
  m_axi_gmem_ARREGION, m_axi_gmem_ARCACHE, m_axi_gmem_ARPROT, m_axi_gmem_ARQOS, 
  m_axi_gmem_ARVALID, m_axi_gmem_ARREADY, m_axi_gmem_RDATA, m_axi_gmem_RRESP, 
  m_axi_gmem_RLAST, m_axi_gmem_RVALID, m_axi_gmem_RREADY)
/* synthesis syn_black_box black_box_pad_pin="s_axi_BUS_A_AWADDR[5:0],s_axi_BUS_A_AWVALID,s_axi_BUS_A_AWREADY,s_axi_BUS_A_WDATA[31:0],s_axi_BUS_A_WSTRB[3:0],s_axi_BUS_A_WVALID,s_axi_BUS_A_WREADY,s_axi_BUS_A_BRESP[1:0],s_axi_BUS_A_BVALID,s_axi_BUS_A_BREADY,s_axi_BUS_A_ARADDR[5:0],s_axi_BUS_A_ARVALID,s_axi_BUS_A_ARREADY,s_axi_BUS_A_RDATA[31:0],s_axi_BUS_A_RRESP[1:0],s_axi_BUS_A_RVALID,s_axi_BUS_A_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_gmem_AWADDR[31:0],m_axi_gmem_AWLEN[7:0],m_axi_gmem_AWSIZE[2:0],m_axi_gmem_AWBURST[1:0],m_axi_gmem_AWLOCK[1:0],m_axi_gmem_AWREGION[3:0],m_axi_gmem_AWCACHE[3:0],m_axi_gmem_AWPROT[2:0],m_axi_gmem_AWQOS[3:0],m_axi_gmem_AWVALID,m_axi_gmem_AWREADY,m_axi_gmem_WDATA[63:0],m_axi_gmem_WSTRB[7:0],m_axi_gmem_WLAST,m_axi_gmem_WVALID,m_axi_gmem_WREADY,m_axi_gmem_BRESP[1:0],m_axi_gmem_BVALID,m_axi_gmem_BREADY,m_axi_gmem_ARADDR[31:0],m_axi_gmem_ARLEN[7:0],m_axi_gmem_ARSIZE[2:0],m_axi_gmem_ARBURST[1:0],m_axi_gmem_ARLOCK[1:0],m_axi_gmem_ARREGION[3:0],m_axi_gmem_ARCACHE[3:0],m_axi_gmem_ARPROT[2:0],m_axi_gmem_ARQOS[3:0],m_axi_gmem_ARVALID,m_axi_gmem_ARREADY,m_axi_gmem_RDATA[63:0],m_axi_gmem_RRESP[1:0],m_axi_gmem_RLAST,m_axi_gmem_RVALID,m_axi_gmem_RREADY" */;
  input [5:0]s_axi_BUS_A_AWADDR;
  input s_axi_BUS_A_AWVALID;
  output s_axi_BUS_A_AWREADY;
  input [31:0]s_axi_BUS_A_WDATA;
  input [3:0]s_axi_BUS_A_WSTRB;
  input s_axi_BUS_A_WVALID;
  output s_axi_BUS_A_WREADY;
  output [1:0]s_axi_BUS_A_BRESP;
  output s_axi_BUS_A_BVALID;
  input s_axi_BUS_A_BREADY;
  input [5:0]s_axi_BUS_A_ARADDR;
  input s_axi_BUS_A_ARVALID;
  output s_axi_BUS_A_ARREADY;
  output [31:0]s_axi_BUS_A_RDATA;
  output [1:0]s_axi_BUS_A_RRESP;
  output s_axi_BUS_A_RVALID;
  input s_axi_BUS_A_RREADY;
  input ap_clk;
  input ap_rst_n;
  output interrupt;
  output [31:0]m_axi_gmem_AWADDR;
  output [7:0]m_axi_gmem_AWLEN;
  output [2:0]m_axi_gmem_AWSIZE;
  output [1:0]m_axi_gmem_AWBURST;
  output [1:0]m_axi_gmem_AWLOCK;
  output [3:0]m_axi_gmem_AWREGION;
  output [3:0]m_axi_gmem_AWCACHE;
  output [2:0]m_axi_gmem_AWPROT;
  output [3:0]m_axi_gmem_AWQOS;
  output m_axi_gmem_AWVALID;
  input m_axi_gmem_AWREADY;
  output [63:0]m_axi_gmem_WDATA;
  output [7:0]m_axi_gmem_WSTRB;
  output m_axi_gmem_WLAST;
  output m_axi_gmem_WVALID;
  input m_axi_gmem_WREADY;
  input [1:0]m_axi_gmem_BRESP;
  input m_axi_gmem_BVALID;
  output m_axi_gmem_BREADY;
  output [31:0]m_axi_gmem_ARADDR;
  output [7:0]m_axi_gmem_ARLEN;
  output [2:0]m_axi_gmem_ARSIZE;
  output [1:0]m_axi_gmem_ARBURST;
  output [1:0]m_axi_gmem_ARLOCK;
  output [3:0]m_axi_gmem_ARREGION;
  output [3:0]m_axi_gmem_ARCACHE;
  output [2:0]m_axi_gmem_ARPROT;
  output [3:0]m_axi_gmem_ARQOS;
  output m_axi_gmem_ARVALID;
  input m_axi_gmem_ARREADY;
  input [63:0]m_axi_gmem_RDATA;
  input [1:0]m_axi_gmem_RRESP;
  input m_axi_gmem_RLAST;
  input m_axi_gmem_RVALID;
  output m_axi_gmem_RREADY;
endmodule