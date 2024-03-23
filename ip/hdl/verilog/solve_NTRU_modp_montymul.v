// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module solve_NTRU_modp_montymul (
        ap_ready,
        a,
        b,
        p,
        p0i,
        ap_return
);


output   ap_ready;
input  [31:0] a;
input  [31:0] b;
input  [31:0] p;
input  [31:0] p0i;
output  [31:0] ap_return;

wire   [31:0] z_fu_58_p0;
wire   [31:0] z_fu_58_p1;
wire   [62:0] z_fu_58_p2;
wire  signed [30:0] mul_ln722_fu_72_p0;
wire  signed [30:0] mul_ln722_fu_72_p1;
wire   [30:0] mul_ln722_fu_72_p2;
wire   [30:0] w_fu_86_p0;
wire   [31:0] w_fu_86_p1;
wire   [61:0] w_fu_86_p2;
wire   [62:0] zext_ln718_fu_92_p1;
wire   [62:0] add_ln723_fu_96_p2;
wire   [31:0] trunc_ln_fu_102_p4;
wire   [31:0] d_fu_112_p2;
wire   [0:0] tmp_fu_118_p3;
wire   [30:0] select_ln724_fu_126_p3;
wire   [30:0] empty_fu_46_p1;
wire   [30:0] and_ln724_fu_134_p2;
wire   [31:0] zext_ln724_fu_140_p1;
wire   [61:0] w_fu_86_p00;
wire   [61:0] w_fu_86_p10;
wire   [62:0] z_fu_58_p00;
wire   [62:0] z_fu_58_p10;

solve_NTRU_mul_32ns_32ns_63_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 63 ))
mul_32ns_32ns_63_1_1_U1(
    .din0(z_fu_58_p0),
    .din1(z_fu_58_p1),
    .dout(z_fu_58_p2)
);

solve_NTRU_mul_31s_31s_31_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 31 ),
    .din1_WIDTH( 31 ),
    .dout_WIDTH( 31 ))
mul_31s_31s_31_1_1_U2(
    .din0(mul_ln722_fu_72_p0),
    .din1(mul_ln722_fu_72_p1),
    .dout(mul_ln722_fu_72_p2)
);

solve_NTRU_mul_31ns_32ns_62_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 31 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 62 ))
mul_31ns_32ns_62_1_1_U3(
    .din0(w_fu_86_p0),
    .din1(w_fu_86_p1),
    .dout(w_fu_86_p2)
);

assign add_ln723_fu_96_p2 = (zext_ln718_fu_92_p1 + z_fu_58_p2);

assign and_ln724_fu_134_p2 = (select_ln724_fu_126_p3 & empty_fu_46_p1);

assign ap_ready = 1'b1;

assign ap_return = (zext_ln724_fu_140_p1 + d_fu_112_p2);

assign d_fu_112_p2 = (trunc_ln_fu_102_p4 - p);

assign empty_fu_46_p1 = p[30:0];

assign mul_ln722_fu_72_p0 = z_fu_58_p2[30:0];

assign mul_ln722_fu_72_p1 = p0i[30:0];

assign select_ln724_fu_126_p3 = ((tmp_fu_118_p3[0:0] == 1'b1) ? 31'd2147483647 : 31'd0);

assign tmp_fu_118_p3 = d_fu_112_p2[32'd31];

assign trunc_ln_fu_102_p4 = {{add_ln723_fu_96_p2[62:31]}};

assign w_fu_86_p0 = w_fu_86_p00;

assign w_fu_86_p00 = mul_ln722_fu_72_p2;

assign w_fu_86_p1 = w_fu_86_p10;

assign w_fu_86_p10 = p;

assign z_fu_58_p0 = z_fu_58_p00;

assign z_fu_58_p00 = b;

assign z_fu_58_p1 = z_fu_58_p10;

assign z_fu_58_p10 = a;

assign zext_ln718_fu_92_p1 = w_fu_86_p2;

assign zext_ln724_fu_140_p1 = and_ln724_fu_134_p2;

endmodule //solve_NTRU_modp_montymul
