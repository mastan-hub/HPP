#include<stdio.h>

typedef unsigned short n_type;

void print_bits(n_type a)
{
   int i;
   for(i = sizeof(n_type)*8; i > 0; i--)
      printf("%d", 1&(a >> i-1) );  

   printf("\n");
}


int main(void){
   n_type a = 1123;
   n_type b = 3423;
   
   printf("a: \t");
   print_bits(a);
   printf("b: \t");
   print_bits(b);
   printf("a|b: \t");
   print_bits(a|b);
   printf("a&b: \t");
   print_bits(a&b);
   printf("a^b: \t");
   print_bits(a^b);
}
