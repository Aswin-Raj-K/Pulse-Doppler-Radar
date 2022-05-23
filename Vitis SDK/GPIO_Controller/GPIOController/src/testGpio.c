
#include "xparameters.h"
#include "xil_types.h"
#include "xil_io.h"

#ifndef SRC_GPIOCONTROL_H_
#define SRC_GPIOCONTROL_H_

typedef struct gpioControl{
	u32 baseAddress;
}gpioControl;

int initGpio(gpioControl* myGpio, u32 baseAddress){
	myGpio->baseAddress = baseAddress;
	return 0;
}

void writeGpio(gpioControl* myGpio, u32 writeData)
{
	Xil_Out32(myGpio->baseAddress, writeData);
}

u32 readGpio(gpioControl* myGpio)
{
	return Xil_In32(myGpio->baseAddress + 4);
}



int main(){
	gpioControl myGpio;
	initGpio(&myGpio,XPAR_GPIO_CONTROLLER_0_S00_AXI_BASEADDR);
	print("GPIO Initialization Successfull\n");
	while(1){
		writeGpio(&myGpio,readGpio(&myGpio));
	}
}

#endif
