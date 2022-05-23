#include "xil_printf.h"
#include <xil_types.h>
#include "xaxidma.h"
#include "xparameters.h"
#include "xil_cache.h"
#include "xil_io.h"
#include "stdio.h"
#include <stdlib.h>

#define DATA_BIT_LEN 			32
#define DATA_INPUT_LEN 			25040
#define DATA_OUTPUT_LEN 		20032
#define DMA_DEV_ID 				XPAR_AXIDMA_0_DEVICE_ID
#define DDR_BASE_ADDR 			XPAR_PS7_DDR_0_S_AXI_BASEADDR
#define NUMBER_OF_TRANSFERS     10
#define MAX_PKT_LEN 			25040


u32 convert(char n[]);
u32 checkHalted(u32 baseAddress, u32 offset);
