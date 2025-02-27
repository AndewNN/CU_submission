// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Tue Sep 19 12:54:31 2023
// Host        : PHUMIPAT-C running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Calculator_CalculatorDisplayer_0_0_stub.v
// Design      : Calculator_CalculatorDisplayer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "CalculatorDisplayer,Vivado 2023.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(seg, an, sw, btnU, btnL, btnD, btnR, clock)
/* synthesis syn_black_box black_box_pad_pin="seg[6:0],an[3:0],sw[7:0],btnU,btnL,btnD,btnR" */
/* synthesis syn_force_seq_prim="clock" */;
  output [6:0]seg;
  output [3:0]an;
  input [7:0]sw;
  input btnU;
  input btnL;
  input btnD;
  input btnR;
  input clock /* synthesis syn_isclock = 1 */;
endmodule
