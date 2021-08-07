#include "funcs.h"
#include <stdio.h>

void f() {
  const int N = 50;
  int v[N];
  int i;
  // Put some values in v
  // Note that i+=2 here meanst that only i = 0, 2, 4, 6 etc will be initialized
  // For other i = 1, 3, 5, 7 etc v[i] will be left uninitialized
  for(i = 0; i < N; i++)
    v[i] = i;
  // Print values v[i] for all i
  for(int i = 0; i < N; i++) {
    printf("v[%2d] = %9d     ", i, v[i]);
    if((i+1) % 5 == 0)
      printf("\n");
  }
}

int otherfunc(int number) {
  int x[888];
  int k;
  for(k = 0; k < 888; k++)
    x[k] = number;
  int sum = 0;
  for(k = 0; k < 888; k++)
    sum += x[k];
  return sum;
}
