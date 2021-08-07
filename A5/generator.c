#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <sys/time.h>



void readN(char* fname, int *N)
{
	FILE *fp = fopen(fname, "r"); 
	if(fscanf(fp, "%d", N));
	fclose(fp);
}

void writeFile(char* fname, double *M, int N){
	FILE *fp = fopen(fname,"w");
	for(int i = 0; i < N; i++) {
		fprintf(fp,"\n");
		for(int j = 0; j < N; j++) {
			fprintf(fp,"%.4f ", M[i*N+j]);
		}
	}
	fclose(fp);
}

void readFile(char* fname, double *A, int N)
{
	FILE *fp = fopen(fname, "r");
	while (!feof(fp))
	{
	  	for(int i=0; i<N; i++){
			for (int j=0; j<N; j++){
				if(fscanf(fp, "%lf", &A[i*N+j]));
			}
	  	}
	}
	fclose(fp);
}


int main(int argc, char* argv[]){

    // 64  128  256  512  1024  2048  4096  8192  16384  
	int N = 16384;	
	double(*A)[N], (*B)[N], (*C)[N];

	A = (double(*)[N])malloc(sizeof(*A) * N);
	B = (double(*)[N])malloc(sizeof(*B) * N);
	C = (double(*)[N])malloc(sizeof(*C) * N);	

	readFile("Amat.txt", *A, N);
	readFile("Bmat.txt", *B, N);
	readFile("Cmat.txt", *C, N);	

	writeFile("A.txt", *A, N);
	writeFile("B.txt", *B, N);
	writeFile("C.txt", *C, N);	
	free(A);
	free(B);
	free(C);
	return 0;
}

/*
(double)rand() / (double)RAND_MAX ;


*/


