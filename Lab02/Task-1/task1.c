#include<stdio.h>


int main()
{
    printf("\nThis is the numbers printed with the for loop: \n");

    for (int i = 100; i > 0; i = i-4)
    {
        printf("the number is =  %d \n", i);
    }

    printf("\nThis is the numbers printed with the while loop \n");

    int k = 100;
    while (k > 0)
    {
        printf("The number is = %d \n", k);
        k = k-4;
    }

    printf("\nThis is the numbers printed with the do-while loop \n");

    int j = 100;
    do
    {
        printf("The number is = %d \n", j);
        j = j - 4;
    } while (j > 0);
    
    return 0;
}