# Pulse-Doppler-Radar
![alt text](BD.png)
![alt text](VivadoBlockDiagram.png)

# FPGA Radar Signal Processor

## Introduction

FPGA (Field-Programmable Gate Array) is extensively used for high computing applications. It provides us with the flexibility of massive parallel data processing, better performance, efficiency, and faster prototyping. FPGA can be configured to run several digital signal processing algorithms within a short period. When compared to equivalent discrete circuits, FPGA occupies less space. These capabilities of FPGA make it the perfect platform for the implementation of a radar signal processor.

Traditional radar signal processors often suffer from slow processing and low resolution, limiting their effectiveness. However, the implementation of a radar signal processor on an FPGA has increased the computation speed while improving the accuracy and precision of the results.

## Signal Processing on FPGA

The signal processing part is designed to be implemented on an FPGA (ZC702) board. It is designed to produce pulses with monotonous frequency as well as chirp. The required RF pulse is generated at the baseband, which will be upconverted to X-band on the SDR (Software-Defined Radio) and transmitted.

The FPGA is programmed to store the sampled data coming from the SDR in the form of a data matrix. The data stored in the data matrix is used to extract the Doppler and range information. Before its implementation onto an actual FPGA board, the radar is simulated using MATLAB to find the best parameters required for the radar to operate.

## Implemented Algorithms

This project includes the implementation of various algorithms, including:

- Hamming window
- FFT (Fast Fourier Transform) algorithm
- Double delay-line canceler
- Matched filtering

## Simulation and Verification

The FPGA simulation results are compared with the reference results obtained in MATLAB for verification.


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

