#include <stdio.h>
#include "funcs.h"

int main() {
  printf("First call to f:\n");
  f();
  otherfunc(1234566);
  printf("Second call to f:\n");
  f();
  
  printf("Third call to f:\n");
  f();
  return 0;
}
