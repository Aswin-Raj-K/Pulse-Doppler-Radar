# Pulse-Doppler-Radar
![alt text](BD.png)
![alt text](VivadoBlockDiagram.png)

## Simulating the Radar Using MATLAB

Before implementing the radar onto an actual FPGA, we need to find the right parameters to ensure it is working as expected. A MATLAB simulation of the radar model is done to finalize the required parameters that meet our needs.

## Implementing the Transmitter on the FPGA

1. Chirp signal generator is to be implemented on the FPGA in the digital domain.
2. The generated digital signal needs to be sent to the SDR for transmitting it through the antenna.

## Ensuring That the Chirp Pulses Transmitted From the FPGA Are as Expected

This can be done using another receiver and observing the transmitted signal transmitted from the FPGA.

## Implementing the Receiver on the FPGA

1. Storing the echo data received by the SDR onto the memory block of FPGA.
2. Processing the digitized data on the FPGA itself.
3. Blocks for Hamming window, 3-pulse canceler, Matched filtering, Threshold detection, and FFT are to be designed for processing the data.

## Exporting the Processed Data for Visualization

1. Export the final processed data from the FPGA to MATLAB for easy visualization.
2. Plotting the result in MATLAB to ensure that the radar is working as expected.

