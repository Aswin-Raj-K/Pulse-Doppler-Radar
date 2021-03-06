#include "xparameters.h"
#include "xstatus.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "xscugic.h"
#include "sleep.h"
#include "miscellaneous.h"
#include <stdio.h>
#include <stdint.h>

#include "sdcard.h"


FIL* fptr;

XAxiDma AxiDma;

int main (void)
{
	xil_printf("Program Started\n\r");
    char line[33];/* Line buffer */
    uint *byteRead;
    u32 data[DATA_INPUT_LEN];
    u32 data_out[DATA_INPUT_LEN];

    int Status;
	Status = SD_Init();
	if(Status != XST_SUCCESS)
		xil_printf("SD card init failed\n\r");
	else
		xil_printf("SD card init success\n\r");

	fptr = openFile("DATA.txt",'r');

	if(fptr == 0)
		xil_printf("File opening failed\n\r");
	else
		xil_printf("File opening success\n\r");
//
//	f_read(fptr,line,sizeof line,byteRead);
//	xil_printf("%s",line);

	xil_printf("File reading started\n\r");
	for(int i = 0 ; i<DATA_INPUT_LEN; i++){
//		f_read(fptr,line,sizeof line,byteRead);
//	    xil_printf("%s\r",line);
	    u32 value = i+1;
//	    xil_printf("%d, %lu\n\r",i,value);
	    data[i] = value;
//	    xil_printf("%s\n\r",line);
//	    xil_printf("%d\n\r",*byteRead);
//	    xil_printf("%lu\n",value);
	}
	xil_printf("File reading finished\n\r");

	for(int i = 0 ; i<DATA_INPUT_LEN; i++)
	    xil_printf("%d %lu\n\r",i+1,data[i]);

	closeFile(fptr);
	SD_Eject();
	xil_printf("Safe to remove SD Card...\n\r");

//	return 0;
	XAxiDma_Config *cfgPtr;
	int status;

	cfgPtr = XAxiDma_LookupConfig(DMA_DEV_ID);
	if(!cfgPtr){
		xil_printf("No config found for %d\r\n",DMA_DEV_ID);
		return XST_FAILURE;
	}

	status = XAxiDma_CfgInitialize(&AxiDma,cfgPtr);
	if(status!=XST_SUCCESS){
		xil_printf("Initialization failed %d\r\n",status);
		return XST_FAILURE;
	}

	if(XAxiDma_HasSg(&AxiDma)){
		xil_printf("Device configured as SG mode");
		return XST_FAILURE;
	}

	XAxiDma_IntrDisable(&AxiDma,XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma,XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DMA_TO_DEVICE);


	Xil_DCacheFlushRange((u32)data,MAX_PKT_LEN);
	Xil_DCacheFlushRange((u32)data_out,MAX_PKT_LEN);


	xil_printf("Starting transfer 1\r\n");
	status = XAxiDma_SimpleTransfer(&AxiDma,(u32)data_out,MAX_PKT_LEN,XAXIDMA_DEVICE_TO_DMA);
	if(status != XST_SUCCESS){
		xil_printf("Device to DMA Transfer Failed with status %d\r\n",status);
		return XST_FAILURE;
	}

	status = XAxiDma_SimpleTransfer(&AxiDma,(u32)data,MAX_PKT_LEN,XAXIDMA_DMA_TO_DEVICE);
	if(status != XST_SUCCESS){
		xil_printf("DMA to Device transfer Failed with status %d\r\n",status);
		return XST_FAILURE;
	}

	while((XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE)) || (XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA))){
		xil_printf("DEVICE TO DMA %d\r\n",XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA));
		xil_printf("DMA TO DEVICE %d\r\n",XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE));
	}
	xil_printf("Finished transfer 1\r\n");
	xil_printf("====================\r\n");

//	xil_printf("Starting transfer 2\r\n");
//	status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR)RxBufferPtr,MAX_PKT_LEN,XAXIDMA_DEVICE_TO_DMA);
//	if(status != XST_SUCCESS){
//		xil_printf("Device to DMA Transfer Failed with status %d\r\n",status);
//		return XST_FAILURE;
//	}
//
//	status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR)TxBufferPtr,MAX_PKT_LEN,XAXIDMA_DMA_TO_DEVICE);
//	if(status != XST_SUCCESS){
//		xil_printf("DMA to Device transfer Failed with status %d\r\n",status);
//		return XST_FAILURE;
//	}
//
//	while((XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE))){
////		xil_printf("DEVICE TO DMA %d\r\n",XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA));
////		xil_printf("DMA TO DEVICE %d\r\n",XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE));
//	}
//	xil_printf("Finished transfer 2\r\n");
//	xil_printf("====================\r\n");


	return 0;
}





























//xil_printf("DMA Functions Started\n\r");
//XAxiDma_Config *myDmaConfig;
//XAxiDma myDma;
//
//u32 status;
//myDmaConfig = XAxiDma_LookupConfigBaseAddr(XPAR_AXIDMA_0_BASEADDR);
//status = XAxiDma_CfgInitialize(&myDma, myDmaConfig);
//if(status!=XST_SUCCESS){
//		xil_printf("DMA Initialization Failed..\n\r");
//		return -1;
//}
//
//Xil_DCacheFlushRange((u32)data, DATA_INPUT_LEN * sizeof(u32));
//Xil_DCacheFlushRange((u32)data_out, DATA_OUTPUT_LEN * sizeof(u32));
//xil_printf("Transfer Begin\n\r");
//
//status = XAxiDma_SimpleTransfer(&myDma,(u32)data_out, DATA_OUTPUT_LEN * sizeof(u32),XAXIDMA_DEVICE_TO_DMA);
//if(status!=XST_SUCCESS){
//	xil_printf("Device to DMA failed with status code %d\n\r",status);
//	return -1;
//}else{
//	xil_printf("Device to DMA successfull\n\r");
//}
//
//status = XAxiDma_SimpleTransfer(&myDma,(u32)data, DATA_INPUT_LEN* sizeof(u32),XAXIDMA_DMA_TO_DEVICE);
//if(status!=XST_SUCCESS){
//	xil_printf("DMA to Device failed with status code %d\n\r",status);
//	return -1;
//}else{
//	xil_printf("DMA to Device successfull\n\r");
//}
//
//status = checkHalted(XPAR_AXIDMA_0_BASEADDR,0x4);
//while(status != 1)
//	status = checkHalted(XPAR_AXIDMA_0_BASEADDR,0x4);
//
//status = checkHalted(XPAR_AXIDMA_0_BASEADDR,0x34);
//while(status != 1)
//	status = checkHalted(XPAR_AXIDMA_0_BASEADDR,0x34);
//
//
//
//xil_printf("DMA Transfer Success..\n");

