#include <iostream>
#include <stdlib.h>
#include <fstream>
#include <complex.h>
#include "radarProcessor.hpp"


int main()
{

	cout<<"Simulation Started"<<endl;
	data_t data_in[DATA_LEN_FULL*2];
	data_t data_out[DATA_LEN_SHORT*2];
	ifstream FFTfileIN("radar_inp_cpp.txt");
	if (FFTfileIN.fail()) {
		std::cerr << "Failed to open file." << endl;
		exit(-1);
	}

	data_t temp;

	for(int i=0; i<DATA_LEN_FULL*2; i++){
		FFTfileIN>>temp;
		data_in[i]=temp;
	}
	FFTfileIN.close();

	top(data_in,data_out);


	ofstream output;
	output.open("out_cpp.txt");
	if( !outdata ) { // file couldn't be opened
	      cout << "Error: file could not be opened" << endl;
	      return 0;
	}
	for(int k=0;k<DATA_LEN_SHORT*2;k++){
		cout << k <<") "<< data_out[k] << endl;
		output << data_out[k] << endl;
	}

	output.close();

	cout<<"Simulation Ended"<<endl;
	return 0;

}
