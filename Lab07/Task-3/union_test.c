#include <stdio.h>

typedef union {
  struct {
    unsigned int bit0:1;
    unsigned int bit1:1;
    unsigned int bit2:1;
    unsigned int bit3:1;
    unsigned int bit4:1;
    unsigned int bit5:1;
    unsigned int bit6:1;
    unsigned int bit7:1;
  };
  char c;
} char_union;

void print_char(char_union x) {
  printf("-----\n");
  printf("x.c = %d\n", x.c);
  printf("x.bit0 = %d\n", x.bit0);
  printf("x.bit1 = %d\n", x.bit1);
  printf("x.bit2 = %d\n", x.bit2);
  printf("x.bit3 = %d\n", x.bit3);
  printf("x.bit4 = %d\n", x.bit4);
  printf("x.bit5 = %d\n", x.bit5);
  printf("x.bit6 = %d\n", x.bit6);
  printf("x.bit7 = %d\n", x.bit7);
}

int main() {
  char_union x;

  x.c = 0;
  print_char(x);

  x.c = 1;
  print_char(x);

  x.c = 2;
  print_char(x);

  x.c = 3;
  print_char(x);

  x.c = -1;
  print_char(x);

  x.c = 0;
  x.bit7 = 1;
  print_char(x);
  
  return 0;
}
