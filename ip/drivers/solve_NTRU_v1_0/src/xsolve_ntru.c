// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xsolve_ntru.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSolve_ntru_CfgInitialize(XSolve_ntru *InstancePtr, XSolve_ntru_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSolve_ntru_Start(XSolve_ntru *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSolve_ntru_IsDone(XSolve_ntru *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSolve_ntru_IsIdle(XSolve_ntru *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSolve_ntru_IsReady(XSolve_ntru *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSolve_ntru_EnableAutoRestart(XSolve_ntru *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSolve_ntru_DisableAutoRestart(XSolve_ntru *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XSolve_ntru_Get_return(XSolve_ntru *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_AP_RETURN);
    return Data;
}
void XSolve_ntru_Set_F_upper(XSolve_ntru *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_F_UPPER_DATA, (u32)(Data));
    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_F_UPPER_DATA + 4, (u32)(Data >> 32));
}

u64 XSolve_ntru_Get_F_upper(XSolve_ntru *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_F_UPPER_DATA);
    Data += (u64)XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_F_UPPER_DATA + 4) << 32;
    return Data;
}

void XSolve_ntru_Set_G_upper(XSolve_ntru *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_G_UPPER_DATA, (u32)(Data));
    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_G_UPPER_DATA + 4, (u32)(Data >> 32));
}

u64 XSolve_ntru_Get_G_upper(XSolve_ntru *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_G_UPPER_DATA);
    Data += (u64)XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_G_UPPER_DATA + 4) << 32;
    return Data;
}

void XSolve_ntru_Set_f(XSolve_ntru *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_F_DATA, (u32)(Data));
    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_F_DATA + 4, (u32)(Data >> 32));
}

u64 XSolve_ntru_Get_f(XSolve_ntru *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_F_DATA);
    Data += (u64)XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_F_DATA + 4) << 32;
    return Data;
}

void XSolve_ntru_Set_g(XSolve_ntru *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_G_DATA, (u32)(Data));
    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_G_DATA + 4, (u32)(Data >> 32));
}

u64 XSolve_ntru_Get_g(XSolve_ntru *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_G_DATA);
    Data += (u64)XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_G_DATA + 4) << 32;
    return Data;
}

void XSolve_ntru_Set_tmp2(XSolve_ntru *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_TMP2_DATA, (u32)(Data));
    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_TMP2_DATA + 4, (u32)(Data >> 32));
}

u64 XSolve_ntru_Get_tmp2(XSolve_ntru *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_TMP2_DATA);
    Data += (u64)XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_TMP2_DATA + 4) << 32;
    return Data;
}

void XSolve_ntru_InterruptGlobalEnable(XSolve_ntru *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_GIE, 1);
}

void XSolve_ntru_InterruptGlobalDisable(XSolve_ntru *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_GIE, 0);
}

void XSolve_ntru_InterruptEnable(XSolve_ntru *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_IER);
    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_IER, Register | Mask);
}

void XSolve_ntru_InterruptDisable(XSolve_ntru *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_IER);
    XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSolve_ntru_InterruptClear(XSolve_ntru *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XSolve_ntru_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_ISR, Mask);
}

u32 XSolve_ntru_InterruptGetEnabled(XSolve_ntru *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_IER);
}

u32 XSolve_ntru_InterruptGetStatus(XSolve_ntru *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XSolve_ntru_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_NTRU_CONTROL_ADDR_ISR);
}

