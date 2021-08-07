#include <stdio.h>
#include <cblas.h>

int main() {
  const int n = 5;
  // Create vector x
  double x[n];
  x[0] = 2.5;
  x[1] = 1.2;
  x[2] = 2.9;
  x[3] = 3.0;
  x[4] = 4.1;
  // Create vector y
  double y[n];
  y[0] = 0.4;
  y[1] = 0.2;
  y[2] = 0.3;
  y[3] = 0.0;
  y[4] = 0.1;
  int i;
  printf("x:\n");
  for(i = 0; i < n; i++)
    printf("x[%d] = %f\n", i, x[i]);
  printf("y:\n");
  for(i = 0; i < n; i++)
    printf("y[%d] = %f\n", i, y[i]);
  // Use BLAS routine daxpy_ to compute y = y + a*x
  int incx = 1;
  int incy = 1;
  double a = 2.0;
  printf("a = %f\n", a);
  cblas_daxpy(n, a, x, incx, y, incy);
  // Print result
  printf("Result of operation y = y + a*x :\n");
  for(i = 0; i < n; i++)
    printf("y[%d] = %f\n", i, y[i]);
  
  return 0;
}
