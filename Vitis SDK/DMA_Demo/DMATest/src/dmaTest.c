//#include "xaxidma.h"
//#include "xparameters.h"
//#include "xil_cache.h"
////#include "xil_types.h"
////#include "xil_io.h"
//#include "stdio.h"
//
//u32 checkHalted(u32 baseAddress, u32 offset){
//	u32 status;
//	status = Xil_In32(baseAddress + offset) & XAXIDMA_HALTED_MASK;
//	return status;
//}
//
//int main(){
//
////	u32 a[] = {1,2,3,4,5,6,7,8};
////	u32 b[8];
////	u32 status;
//	print("Program Started\n");
//	FILE *file = fopen("inp_cpp", "r"); /* should check the result */
//	char line[256];
//
//
//	print("File Reading Started\n");
////	if(file)
////		print("File exist\n");
////	else{
////		print("File does not exist\n");
////		return 0;
////	}
//	while (fgets(line, sizeof(line), file)) {
//		print("Ouput\n");
//		print(line);
//	}
//	fclose(file);
//	print("File Reading Finished\n");
//
//	return 0;
//
////	XAxiDma_Config *myDmaConfig;
////	XAxiDma myDma;
////
////	myDmaConfig = XAxiDma_LookupConfigBaseAddr(XPAR_AXI_DMA_0_BASEADDR);
////	status = XAxiDma_CfgInitialize(&myDma, myDmaConfig);
////	if(status!=XST_SUCCESS){
////			print("DMA Initialization Failed..\n");
////			return -1;
////	}
////	print("DMA Initialization Success..\n");
////
////	Xil_DCacheFlushRange((u32)a, 8 * sizeof(u32));
////
////	status = XAxiDma_SimpleTransfer(&myDma,(u32)b, 8 * sizeof(u32),XAXIDMA_DEVICE_TO_DMA);
////
////	status = XAxiDma_SimpleTransfer(&myDma,(u32)a, 8 * sizeof(u32),XAXIDMA_DMA_TO_DEVICE);
////	if(status!=XST_SUCCESS){
////		print("DMA Configure Failed..\n");
////		return -1;
////	}
////	status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x4);
////	while(status != 1)
////		status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x4);
////
////	status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x34);
////	while(status != 1)
////		status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x34);
////
//////	print("DMA Configure Success..\n");
////	print("DMA Transfer Success..\n");
////	return 0;
//}
//
//

#include <xil_types.h>
#include "ff.h"
#include "xil_printf.h"
#include <xstatus.h>
#include "xil_cache.h"
int main(){
	return 0;
}
