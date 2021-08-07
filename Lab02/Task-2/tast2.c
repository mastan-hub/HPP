#include <stdio.h>

int main()
{
    int a;
    int b;
    printf("Please inser the length & height of the rectangle: ");
    scanf("%i %i", &a, &b);

    for (int i = 1; i <= b; i++)
    {
        printf("\n*");
        
        for (int j = 1; j <= a; j++)
        {
            if (i == 1 || i == b || j == a)
            {
                printf("*");
            } 
            else 
            {
                printf("-");
            }
        }
    }
    
    printf("\n");
    return 0;
}