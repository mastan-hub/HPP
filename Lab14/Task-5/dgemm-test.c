#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>

/* Declaration for dgemm_(): BLAS function for double-precision
   matrix-matrix multiplication. */
void dgemm_(const char *ta,const char *tb,
	    const int *n, const int *k, const int *l,
	    const double *alpha,const double *A,const int *lda,
	    const double *B, const int *ldb,
	    const double *beta, double *C, const int *ldc);

static double get_wall_seconds() {
  struct timeval tv;
  gettimeofday(&tv, NULL);
  double seconds = tv.tv_sec + (double)tv.tv_usec / 1000000;
  return seconds;
}

int main(int argc, char** argv) {
  if(argc != 2) {
    printf("Please give one input argument: the matrix size N\n");
    return -1;
  }
  int N = atoi(argv[1]);
  printf("N = %d\n", N);

  // Allocate memory for input matrices A and B
  double* A = (double*)malloc(N*N*sizeof(double));
  double* B = (double*)malloc(N*N*sizeof(double));

  // Allocate memory for reference result matrix C_ref
  double* C_ref = (double*)malloc(N*N*sizeof(double));

  // Allocate memory for dgemm result matrix C_dgemm
  double* C_dgemm = (double*)malloc(N*N*sizeof(double));

  // TODO: Write code to compute reference matrix C_ref here!

  // TODO: Print time it took to compute C_ref.

  // TODO: Write code call dgemm BLAS routine to compute C_dgemm here!

  // TODO: Print time it took to compute C_dgemm.

  // TODO: Write code to compare C_ref and C_dgemm here, print maximum
  // difference found. Print a happy message if difference is small,
  // and a sad error message otherwise.

  free(A);
  free(B);
  free(C_ref);
  free(C_dgemm);
  
  return 0;
}
