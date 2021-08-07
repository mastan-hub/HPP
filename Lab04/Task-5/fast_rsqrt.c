#include <stdlib.h>
#include <stdio.h>
#include <math.h> 			// Remember to link with -lm

// From Quake III: 
float Q_rsqrt( float number ) 
{
   long i;
   float x2, y;
   const float threehalfs = 1.5F;
   x2 = number * 0.5F;
   y  = number;
   i  = * ( long * ) &y;				// evil floating point bit level hacking
   i  = 0x5f3759df - ( i >> 1 ); 		// what the fuck?
   y  = * ( float * ) &i;	
   y  = y * ( threehalfs - ( x2 * y * y ) );	// 1st iteration
  // y  = y * ( threehalfs - ( x2 * y * y ) );	// 2nd iteration, this can be removed
   return y;
}

/* From Hacker's Delight:
This is a very approximate but very fast version of rsqrt. It is just
two integer instructions (shift right and subtract), plus instructions
to load the constant.
   The constant 0x5f37642f balances the relative error at +-0.034213. */
float rsqrt2(float x) 
{
   int i = *(int *)&x;			// View x as an int.
   i = 0x5f37642f - (i >> 1);	// Initial guess.
   x = *(float *)&i;			// View i as float.
   return x;
}

// The obvious way:
float rsqrt(float x)
{
   return 1/sqrtf(x);
}

int main(int argc, char ** argv)
{
   int i, fn;
   float x = 65432.1, rsqrtx;
   
   if(argc < 2)
      fn = 0;
    else {
      fn = atoi(argv[1]); 
    }
    if(fn == 0)
       printf("rsqrt(x)\n");           
    else if(fn == 1)
       printf("rsqrt2(x)\n");
    else
       printf("Q_rsqrt(x)\n");
   for(i=0; i<10000000; i++)
   {
       if(fn == 0)
          rsqrtx = rsqrt(x);           
       else if(fn == 1)
          rsqrtx = rsqrt2(x);
       else
          rsqrtx = Q_rsqrt(x);
   }
   printf("x = %f, x^(-0.5) = %f\n", x, rsqrtx);
}


