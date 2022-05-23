#include "radarProcessor.hpp"


void array2RealImag(data_t src[DATA_LEN_FULL*2], data_t real[DATA_LEN_FULL], data_t imag[DATA_LEN_FULL]){

	for(int i = 0 ;i<DATA_LEN_FULL;i++)
		real[i] = src[i];


	for(int i = 0 ;i<DATA_LEN_FULL;i++)
		imag[i] = src[i+DATA_LEN_FULL];

}

void realImag2Array( data_t real[DATA_LEN_SHORT], data_t imag[DATA_LEN_SHORT], data_t dest[DATA_LEN_SHORT*2]){

	for(int i = 0 ;i<DATA_LEN_SHORT;i++)
		dest[i] = real[i];


	for(int i = 0 ;i<DATA_LEN_SHORT;i++)
		dest[i+DATA_LEN_SHORT] = imag[i];

}

//313x40 row major
//void axis2Mat(data_t src[DATA_LEN_FULL*2], data_comp A[N][K]) {
//    for(int i = 0; i < N; i++){
//        for(int j = 0; j<K; j++){
//            int index = K*i + j;
//            A[i][j] = data_comp(src[index],src[index + DATA_LEN_FULL]);
//        }
//    }
//}

void axis2Mat(data_t real[DATA_LEN_FULL],data_t imag[DATA_LEN_FULL], data_comp A[N][K]) {
    for(int i = 0; i < N; i++){
        for(int j = 0; j<K; j++){
            int index = K*i + j;
            A[i][j] = data_comp(real[index],imag[index]);
        }
    }
}


//313x39 row major
//void mat2Axis(data_comp C[N][FFT_LEN],data_t dst[DATA_LEN_SHORT*2]) {
//    for(int i = 0; i < N; i++){
//        for(int j = 0; j<FFT_LEN; j++){
//            int index = FFT_LEN*i + j;
//            dst[index] = C[i][j].real();
//            dst[index + DATA_LEN_SHORT] = C[i][j].imag();
//        }
//    }
//}


void mat2Axis(data_comp C[][K],data_t real[DATA_LEN_SHORT], data_t imag[DATA_LEN_SHORT]) {
    for(int i = 0; i < N; i++){
        for(int j = 0; j<FFT_LEN; j++){
            int index = FFT_LEN*i + j;
            data_comp temp = C[i][j];
            imag[index] = temp.imag();
            real[index] = temp.real();
        }
    }
}


void matmul(data_comp a[][K], data_comp out[][K]){

	data_comp sum = data_comp(0,0);
    for (int i = 0; i < N; i++){
        for (int j = 0; j < M; j++) {
            for (int k = 0; k < K; k++){
				#pragma HLS PIPELINE
            	if(k==0)
					sum = data_comp(0,0);
                sum += a[i][k] * pulseCanceler_coeff[k][j];
                if(k==K-1)
                	out[i][j] = sum;
            }
        }
    }
}

void matchedFilter(data_comp a[][K],data_comp out[][K]){

	data_comp sum = data_comp(0,0);
    for (int k = 0; k < M; k++){
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++){
				#pragma HLS PIPELINE
                if((i-j) >= 0 && (i-j) < FILTER_LEN)
                    sum = sum + a[j][k] * matchedFilter_coeff[i-j];
                if(j == (N - 1)){
                    out[i][k] = sum;
                    sum = data_comp(0,0);
                }
            }
        }

    }
}

void hammingWindow(data_comp a[][K],data_comp out[][K])
{
	for(int i = 0 ;i<N;i++){
		for(int j = 0;j<M;j++){
			out[i][j] = a[i][j]*hamming_coeff[j];
		}
	}
}

void fft(data_comp a[][K],data_comp out[][K]){
	data_comp sum = data_comp(0,0);
	for (int i = 0; i < N; i++){
		for (int j = 0; j < FFT_LEN; j++) {
			for (int k = 0; k < FFT_LEN; k++){
				#pragma HLS PIPELINE
				sum += a[i][k] * fft_coeff[j][k];
				if(k==FFT_LEN-1){
					out[i][j] = sum;
					sum = data_comp(0,0);
				}
			}
		}
	}
}




void top(data_t data_IN[DATA_LEN_FULL*2], data_t data_OUT[DATA_LEN_SHORT*2]){
	#pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE axis port=data_OUT
    #pragma HLS INTERFACE axis port=data_IN

	data_t real[DATA_LEN_FULL];
	data_t imag[DATA_LEN_FULL];
    data_comp mat_A[N][K];
    data_comp mat_B[N][K];

    array2RealImag(data_IN,real,imag);
    axis2Mat(real,imag,mat_A);
    matmul(mat_A,mat_B);
    matchedFilter(mat_B,mat_A);
    hammingWindow(mat_A,mat_B);
    fft(mat_B,mat_A);
    mat2Axis(mat_A,real,imag);
    realImag2Array(real,imag,data_OUT);
//#define M 39
//#define N 313
//#define K 40
//#define FFT_LEN 32
}
