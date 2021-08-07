#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <sys/time.h>



// Reads data from file and populates the matrix
void readFile(char* fname, double *A, int N){
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

// Write the data into a file
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


int main() {


  // 64  128  256  512  1024  2048  4096  8192  16384  
  int N = 2048;          //Matrix size.
  int nth = 16;           //Number of processing elements.

  struct timeval tv1, tv2;
  struct timezone tz;
	double elapsed;

  int i,j,k;
  double (*A)[N], (*B)[N], (*C)[N];

  A = (double(*)[N])malloc(sizeof(*A) * N);
  B = (double(*)[N])malloc(sizeof(*B) * N);
  C = (double(*)[N])malloc(sizeof(*C) * N);

  readFile("A-2048.txt", *A, N);
  readFile("B-2048.txt", *B, N);

  gettimeofday(&tv1, &tz);

  omp_set_num_threads(nth);
  #pragma omp parallel for private(i,j,k) shared(A,B,C)
  for (i = 0; i < N; ++i) {
    for (j = 0; j < N; ++j){
        for (k = 0; k < N; ++k) {
            C[i][j] += A[i][k] * B[k][j];
        }
    }
  }

  gettimeofday(&tv2, &tz);
  elapsed = (double) (tv2.tv_sec-tv1.tv_sec) + (double) (tv2.tv_usec-tv1.tv_usec) * 1.e-6;
  printf("elapsed time = %f seconds.\n", elapsed);
  printf("Number of cores used = %d \n", nth);
  printf("Matrix Size = %d \n", N);
  
  // writeFile("reference.txt", *C, N);
  free(A);
  free(B);
  free(C);
}





/*
int i,j,k;
struct timeval tv1, tv2;
struct timezone tz;
double elapsed; 
omp_set_num_threads(omp_get_num_procs());
for (i= 0; i< N; i++)
    for (j= 0; j< N; j++)
{
        A[i][j] = 2;
        B[i][j] = 2;
}
gettimeofday(&tv1, &tz);c
#pragma omp parallel for private(i,j,k) shared(A,B,C)
for (i = 0; i < N; ++i) {
    for (j = 0; j < N; ++j) 
        for (k = 0; k < N; ++k) {
            C[i][j] += A[i][k] * B[k][j];
        }
    }
}
gettimeofday(&tv2, &tz);
elapsed = (double) (tv2.tv_sec-tv1.tv_sec) + (double) (tv2.tv_usec-tv1.tv_usec) * 1.e-6;
printf("elapsed time = %f seconds.\n", elapsed);

for (i= 0; i< N; i++)
{
    for (j= 0; j< N; j++)
    {
        printf("%d\t",C[i][j]);
    }
    printf("\n");
}
*/

 