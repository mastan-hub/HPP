#include <stdio.h>

int main()
{
    int i1;
    int i2;
    int sum;
    int prod;
    printf("Please inser your two numbers with a space in between:\n");
    scanf("%i%i", &i1, &i2);
    if (i1 % 2 == 0 && i2 % 2 == 0)
    {
        sum = i1 + i2;
        printf("Both numbers are even and their sum is = %i\n", sum);
    } else 
    {
        prod = i1 * i2;
        printf("At least one of the numbers are odd and their product is = %i\n", prod);
    }
    
    return 0;
}