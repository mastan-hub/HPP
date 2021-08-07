#include <stdio.h>
#include <stdlib.h>

typedef struct {
  short int arr[8];
  long int x;
} A;

typedef struct {
  long int x;
  short int arr[8];
} B;

int main(){
  A* a = (A*)malloc(sizeof(A));
  B* b = (B*)malloc(sizeof(B));

  a->x = 7;
  for(int i = 0; i < 8; i++)
    a->arr[i] = -1;
  printf("a->x = %d\n", a->x);

  b->x = 7;
  for(int i = 0; i < 8; i++)
    b->arr[i] = -1;
  printf("b->x = %d\n", b->x);

  free(a);
  free(b);
  
  return 0;
}
