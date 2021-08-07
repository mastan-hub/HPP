#include <stdio.h>

typedef struct {
  char c1;
  char c2;
  char c3;
  char c4;
  char c5;
} A;

typedef struct {
  int i;
  char c5;
} B;

typedef struct {
  char c1;
  int i1;
  char c2;
  int i2;
  char c3;
  int i3;
  char c4;
  int i4;
} C;

typedef struct {
  int i1;
  int i2;
  int i3;
  int i4;
  char c1;
  char c2;
  char c3;
  char c4;
} D;

int main() {
  printf("sizeof(A) = %lu\n", sizeof(A));
  printf("sizeof(B) = %lu\n", sizeof(B));
  printf("sizeof(C) = %lu\n", sizeof(C));
  printf("sizeof(D) = %lu\n", sizeof(D));
  // Investigate the data layout in a C struct
  // First we create a buffer with the same size as C, and set it to zero
  int sz = sizeof(C);
  char buf[sz];
  for(int i = 0; i < sz; i++)
    buf[i] = 0;
  // Now create a pointer to C and make it point to the zero-filled buffer
  C* ptr = (C*)buf;
  // Now set member values for the struct pointed to by C (that uses the same memory as buf)
  ptr->c1 = 22;
  ptr->i1 = -1;
  ptr->c2 = 33;
  ptr->i2 = -1;
  ptr->c3 = 44;
  ptr->i3 = -1;
  ptr->c4 = 55;
  ptr->i4 = -1;
  // Now print the contents of buf
  printf("buf contents:\n");
  for(int i = 0; i < sz; i++)
    printf("%4d\n", buf[i]);
  return 0;
}
