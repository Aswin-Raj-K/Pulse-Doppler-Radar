
#include "miscellaneous.h"


u32 powers[] = {
		1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768,65536,131072,262144,524288,
		1048576,2097152,4194304,8388608,16777216,33554432,67108864,134217728,268435456,536870912,1073741824,2147483648};

//Function to convert binary to decimal
u32 convert(char n[]) {
  u32 dec = 0;
  for(int i=0;i<32;i++){
//	  xil_printf("%d\n\r",(((int)n[i])-48));
	  dec+= (((int)n[i])-48) * powers[31-i];
  }

  return dec;
}

u32 checkHalted(u32 baseAddress, u32 offset){
	u32 status;
	status = Xil_In32(baseAddress + offset) & XAXIDMA_HALTED_MASK;
	return status;
}
