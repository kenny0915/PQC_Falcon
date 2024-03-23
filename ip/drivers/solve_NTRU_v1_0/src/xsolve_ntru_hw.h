// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/COR)
//        bit 0 - ap_done (Read/COR)
//        bit 1 - ap_ready (Read/COR)
//        others - reserved
// 0x10 : Data signal of ap_return
//        bit 31~0 - ap_return[31:0] (Read)
// 0x18 : Data signal of F_upper
//        bit 31~0 - F_upper[31:0] (Read/Write)
// 0x1c : Data signal of F_upper
//        bit 31~0 - F_upper[63:32] (Read/Write)
// 0x20 : reserved
// 0x24 : Data signal of G_upper
//        bit 31~0 - G_upper[31:0] (Read/Write)
// 0x28 : Data signal of G_upper
//        bit 31~0 - G_upper[63:32] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of f
//        bit 31~0 - f[31:0] (Read/Write)
// 0x34 : Data signal of f
//        bit 31~0 - f[63:32] (Read/Write)
// 0x38 : reserved
// 0x3c : Data signal of g
//        bit 31~0 - g[31:0] (Read/Write)
// 0x40 : Data signal of g
//        bit 31~0 - g[63:32] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of tmp2
//        bit 31~0 - tmp2[31:0] (Read/Write)
// 0x4c : Data signal of tmp2
//        bit 31~0 - tmp2[63:32] (Read/Write)
// 0x50 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSOLVE_NTRU_CONTROL_ADDR_AP_CTRL      0x00
#define XSOLVE_NTRU_CONTROL_ADDR_GIE          0x04
#define XSOLVE_NTRU_CONTROL_ADDR_IER          0x08
#define XSOLVE_NTRU_CONTROL_ADDR_ISR          0x0c
#define XSOLVE_NTRU_CONTROL_ADDR_AP_RETURN    0x10
#define XSOLVE_NTRU_CONTROL_BITS_AP_RETURN    32
#define XSOLVE_NTRU_CONTROL_ADDR_F_UPPER_DATA 0x18
#define XSOLVE_NTRU_CONTROL_BITS_F_UPPER_DATA 64
#define XSOLVE_NTRU_CONTROL_ADDR_G_UPPER_DATA 0x24
#define XSOLVE_NTRU_CONTROL_BITS_G_UPPER_DATA 64
#define XSOLVE_NTRU_CONTROL_ADDR_F_DATA       0x30
#define XSOLVE_NTRU_CONTROL_BITS_F_DATA       64
#define XSOLVE_NTRU_CONTROL_ADDR_G_DATA       0x3c
#define XSOLVE_NTRU_CONTROL_BITS_G_DATA       64
#define XSOLVE_NTRU_CONTROL_ADDR_TMP2_DATA    0x48
#define XSOLVE_NTRU_CONTROL_BITS_TMP2_DATA    64

