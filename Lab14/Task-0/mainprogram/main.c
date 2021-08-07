#include <stdio.h>

/* Function declarations. */
int Thelma(int x);
int Louise(int x);

/* Main program. */
int main() {
  int x = Thelma(5);
  int y = Louise(7);
  printf("x (from Thelma) = %d\n", x);
  printf("y (from Louise) = %d\n", y);
}
