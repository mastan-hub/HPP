#include <stdio.h>
#include <stdlib.h>

#ifndef max
    #define max(a,b) ((a) > (b) ? (a) : (b))
#endif


int main()
{
    int i1;
    int i2;
    int i3;
    printf("Please inser your numbers with a space in between:");
    scanf("%i%i%i", &i1, &i2, &i3);

    int a1 = abs(i1);
    int a2 = abs(i2);
    int a3 = abs(i3);    

    int m = max (a1, a2);
    m = max(m, a3);

    printf("The largest absolute value is %i\n", m);
    return 0;
}