// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsolve_ntru.h"

extern XSolve_ntru_Config XSolve_ntru_ConfigTable[];

XSolve_ntru_Config *XSolve_ntru_LookupConfig(u16 DeviceId) {
	XSolve_ntru_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSOLVE_NTRU_NUM_INSTANCES; Index++) {
		if (XSolve_ntru_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSolve_ntru_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSolve_ntru_Initialize(XSolve_ntru *InstancePtr, u16 DeviceId) {
	XSolve_ntru_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSolve_ntru_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSolve_ntru_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

