// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSOLVE_NTRU_H
#define XSOLVE_NTRU_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xsolve_ntru_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XSolve_ntru_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XSolve_ntru;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSolve_ntru_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSolve_ntru_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSolve_ntru_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSolve_ntru_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XSolve_ntru_Initialize(XSolve_ntru *InstancePtr, u16 DeviceId);
XSolve_ntru_Config* XSolve_ntru_LookupConfig(u16 DeviceId);
int XSolve_ntru_CfgInitialize(XSolve_ntru *InstancePtr, XSolve_ntru_Config *ConfigPtr);
#else
int XSolve_ntru_Initialize(XSolve_ntru *InstancePtr, const char* InstanceName);
int XSolve_ntru_Release(XSolve_ntru *InstancePtr);
#endif

void XSolve_ntru_Start(XSolve_ntru *InstancePtr);
u32 XSolve_ntru_IsDone(XSolve_ntru *InstancePtr);
u32 XSolve_ntru_IsIdle(XSolve_ntru *InstancePtr);
u32 XSolve_ntru_IsReady(XSolve_ntru *InstancePtr);
void XSolve_ntru_EnableAutoRestart(XSolve_ntru *InstancePtr);
void XSolve_ntru_DisableAutoRestart(XSolve_ntru *InstancePtr);
u32 XSolve_ntru_Get_return(XSolve_ntru *InstancePtr);

void XSolve_ntru_Set_F_upper(XSolve_ntru *InstancePtr, u64 Data);
u64 XSolve_ntru_Get_F_upper(XSolve_ntru *InstancePtr);
void XSolve_ntru_Set_G_upper(XSolve_ntru *InstancePtr, u64 Data);
u64 XSolve_ntru_Get_G_upper(XSolve_ntru *InstancePtr);
void XSolve_ntru_Set_f(XSolve_ntru *InstancePtr, u64 Data);
u64 XSolve_ntru_Get_f(XSolve_ntru *InstancePtr);
void XSolve_ntru_Set_g(XSolve_ntru *InstancePtr, u64 Data);
u64 XSolve_ntru_Get_g(XSolve_ntru *InstancePtr);
void XSolve_ntru_Set_tmp2(XSolve_ntru *InstancePtr, u64 Data);
u64 XSolve_ntru_Get_tmp2(XSolve_ntru *InstancePtr);

void XSolve_ntru_InterruptGlobalEnable(XSolve_ntru *InstancePtr);
void XSolve_ntru_InterruptGlobalDisable(XSolve_ntru *InstancePtr);
void XSolve_ntru_InterruptEnable(XSolve_ntru *InstancePtr, u32 Mask);
void XSolve_ntru_InterruptDisable(XSolve_ntru *InstancePtr, u32 Mask);
void XSolve_ntru_InterruptClear(XSolve_ntru *InstancePtr, u32 Mask);
u32 XSolve_ntru_InterruptGetEnabled(XSolve_ntru *InstancePtr);
u32 XSolve_ntru_InterruptGetStatus(XSolve_ntru *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
