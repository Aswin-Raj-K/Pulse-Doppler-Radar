#include "3pulseCanceler.hpp"

void axis2Mat(data_comp src[IN_LEN], data_comp A[n][m]) {
    for(int i = 0; i < n; i++){
        for(int j = 0; j<m; j++){
            int index = m*i + j;
            A[i][j] = src[index];
        }
    }
}

void mat2Axis(data_comp C[n][mn], data_comp dst[OUT_LEN]) {
    for(int i = 0; i < n; i++){
        for(int j = 0; j<mn; j++){
            int index = mn*i + j;
            dst[index] = C[i][j];
        }
    }
}

void matmul(data_comp a[n][m], data_comp out[n][mn]){

	data_comp sum = data_comp(0,0);
    for (int i = 0; i < n; i++){
        for (int j = 0; j < mn; j++) {
            for (int k = 0; k < m; k++){
				#pragma HLS PIPELINE
            	if(k==0)
					sum = data_comp(0,0);
                sum += a[i][k] * coeff[k][j];
                if(k==m-1)
                	out[i][j] = sum;
            }
        }
    }
}

//void matmul(data_comp a[IN_LEN], data_comp out[OUT_LEN]){
//	#pragma HLS ARRAY_PARTITION variable=a dim=1 cyclic factor=40
//	#pragma HLS ARRAY_PARTITION variable=out dim=1 block factor=40
//    for (int i = 0; i < n; i++){
//        for (int j = 0; j < mn; j++) {
//			#pragma HLS PIPELINE
//        	data_comp sum = data_comp(0,0);
//            for (int k = 0; k < m; k++)
//                sum += a[k*n + i] * coeff[k*mn + j];
//			out[i*mn + j] = sum;
//        }
//    }
//}
//


void top(data_comp data_IN[IN_LEN], data_comp data_OUT[OUT_LEN]){

    #pragma HLS INTERFACE axis port=data_OUT
    #pragma HLS INTERFACE axis port=data_IN

    data_comp mat_A[n][m];
    data_comp mat_C[n][mn];

    axis2Mat(data_IN,mat_A);
    matmul(mat_A,mat_C);
    mat2Axis(mat_C,data_OUT);
}
