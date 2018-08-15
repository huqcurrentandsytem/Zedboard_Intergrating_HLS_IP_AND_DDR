/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xscugic.h"
#include "xddr_hls_test.h"

// HLS macc HW instance
XDdr_hls_test hls_test;
//Interrupt Controller Instance
XScuGic ScuGic;

volatile static int RunHlsMacc = 0;
volatile static int ResultAvailHlsMacc = 0;

int xddr_hls_test_init(XDdr_hls_test *hls_maccPtr)
{
	XDdr_hls_test_Config *cfgPtr;
	int status;
	cfgPtr = XDdr_hls_test_LookupConfig(XPAR_XDDR_HLS_TEST_0_DEVICE_ID);
	if (!cfgPtr) {
		print("ERROR: Lookup of accelerator configuration failed.\n\r");
		return XST_FAILURE;
	}
	status = XDdr_hls_test_CfgInitialize(hls_maccPtr, cfgPtr);
	if (status != XST_SUCCESS) {
		print("ERROR: Could not initialize accelerator.\n\r");
		return XST_FAILURE;
	}
	return status;
}

void xddr_hls_test_start(void *InstancePtr)
{
	XDdr_hls_test *pAccelerator = (XDdr_hls_test *)InstancePtr;
	XDdr_hls_test_InterruptEnable(pAccelerator,1);
	XDdr_hls_test_InterruptGlobalEnable(pAccelerator);
	XDdr_hls_test_Start(pAccelerator);
}

void xddr_hls_test_isr(void *InstancePtr){
	XDdr_hls_test *pAccelerator = (XDdr_hls_test *)InstancePtr;

   //Disable the global interrupt
	XDdr_hls_test_InterruptGlobalDisable(pAccelerator);
   //Disable the local interrupt
	XDdr_hls_test_InterruptDisable(pAccelerator,0xffffffff);

   // clear the local interrupt
	XDdr_hls_test_InterruptClear(pAccelerator,1);

   ResultAvailHlsMacc = 1;
   // restart the core if it should run again
   if(RunHlsMacc){
	   xddr_hls_test_start(pAccelerator);
   }
}

int setup_interrupt()
{
   //This functions sets up the interrupt on the ARM
   int result;
   XScuGic_Config *pCfg = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
   if (pCfg == NULL){
      print("Interrupt Configuration Lookup Failed\n\r");
      return XST_FAILURE;
   }
   result = XScuGic_CfgInitialize(&ScuGic,pCfg,pCfg->CpuBaseAddress);
   if(result != XST_SUCCESS){
      return result;
   }
   // self test
   result = XScuGic_SelfTest(&ScuGic);
   if(result != XST_SUCCESS){
      return result;
   }
   // Initialize the exception handler
   Xil_ExceptionInit();
   // Register the exception handler
   //print("Register the exception handler\n\r");
   Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,&ScuGic);
   //Enable the exception handler
   Xil_ExceptionEnable();
   // Connect the Adder ISR to the exception table
   //print("Connect the Adder ISR to the Exception handler table\n\r");
   result = XScuGic_Connect(&ScuGic,XPAR_FABRIC_DDR_HLS_TEST_0_INTERRUPT_INTR,(Xil_InterruptHandler)xddr_hls_test_isr,&hls_test);
   if(result != XST_SUCCESS){
      return result;
   }
   //print("Enable the Adder ISR\n\r");
   XScuGic_Enable(&ScuGic,XPAR_FABRIC_DDR_HLS_TEST_0_INTERRUPT_INTR);
   return XST_SUCCESS;
}


int main()
{
    init_platform();
    print("Start\n\r");

    int i;
    int status;

    //Setup the matrix mult
    status = xddr_hls_test_init(&hls_test);
    if(status != XST_SUCCESS){
       print("HLS peripheral setup failed\n\r");
       exit(-1);
    }
    //Setup the interrupt
    status = setup_interrupt();
    if(status != XST_SUCCESS){
       print("Interrupt setup failed\n\r");
       exit(-1);
    }

//    //set the input parameters of the HLS block
//    u32 ans = XDdr_hls_test_Get_hls_check(&hls_test);
//
//    while (ans == 1234)
//    {
//    	ans = XDdr_hls_test_Get_hls_check(&hls_test);
//    }
    print("HLS started\n\r");
    int factor = 1000;
    XDdr_hls_test_Set_start_signal_i(&hls_test, 1994);
    XDdr_hls_test_Set_num(&hls_test, factor);
    XDdr_hls_test_Set_saMaster(&hls_test,0x10000000);
    printf("HLS DDR3 offset: 0x%x\n\r",0x10000000);
    int timer_user = 0;
    if (0) { // use interrupt
    	xddr_hls_test_start(&hls_test);
    	print("Detecting interrupt from HLS HW.\n\r");
       while(!ResultAvailHlsMacc)
       {
    	   timer_user++;
       }
          ; // spin
       print("Interrupt received from HLS HW.\n\r");
    } else { // Simple non-interrupt driven test
    	xddr_hls_test_start(&hls_test);
    	print("Detecting HLS peripheral complete.\n\r");
       do {
    	   timer_user++;
       } while (!XDdr_hls_test_IsReady(&hls_test));
       print("Detected HLS peripheral complete. Result received.\n\r");
    }
    double seconds = (double)timer_user/4944331.0;
    printf("burst number: %d\n\r",factor*20480);
    printf("time:%.03lfs\n\r",seconds);
    printf("random bursts per second :%.04lf\n\r",((double)factor*20480.0)/seconds);
    printf("random bursts per second :%.04lfM\n\r",((double)factor*20480.0)/seconds/1000000.0);
    printf("since frequency of HLS block is 100MHz\n\r");
    double tmp0 = ((double)factor*20480.0)/seconds/1000000.0;
    printf("latency of random access is : %.03lf cycles @100MHz\n\r",100.0/tmp0);
    print("-------------------------------------------------done and check as below\n\r");
    //for(i=0;i<1000000000;i++);
    int check_list[]={4082006, 7693227, 2600529, 1212728, 2439467, 6403010, 5854406, 3537426, 1896840, 6059616, 8104952};
    int check_result = 0;
    for(i=0;i<10;i++)
    {
    	if (i+factor-1==Xil_In32(0x10000000+(check_list[i]*8))) check_result++;
    	printf("addr=%d: expected:%d=== result:%u\n\r",check_list[i],i+factor-1,Xil_In32(0x10000000+(check_list[i]*8)));
    }
    if (check_result==10) printf("check passed\n\r");
    else printf("check failed\n\r");
    printf("----------------------------------------------\n\r");

    cleanup_platform();
    return 0;
}
