#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <math.h>
#include <omp.h>
#include <pthread.h>


toSparse(char* fname, double *M, int N)
{
  FILE *fp = fopen(fname, "r");
  int tmp = 0;
  while (!feof(fp))
  {
    for(int i=0; i<N; i++){
      for (int j=0; j<N; j++){
        tmp = fscanf(fp, "%lf", &M[i*N+j]);
      }
    }
  }
  fclose(fp);
}

  
int main()
{

    int N = 1000;
    double(*A)[N], (*B)[N], (*C)[N];
    A = (double(*)[N])malloc(sizeof(*A) * N);
    B = (double(*)[N])malloc(sizeof(*B) * N);
    C = (double(*)[N])malloc(sizeof(*B) * N);


    // for (int i = 0; i<N; i++) {
    //   for (int j = 0; j<N; j++) {
    //       if (i == j || i == j-1 || j == i-1) {
    //         A[i][j]= 2;
    //         B[i][j]= 4;
    //     }
    //   }
    // }
    // for (int i = 0; i < N; ++i) {
    //     printf("\n");
    //     for (int j = 0; j < N; ++j){
    //             printf("%f ", B[i][j]);
    //     }
    // }
    // int countA = 0;
    // int countB = 0;
    // for (int i = 0; i < N; ++i) {
    //     for (int j = 0; j < N; ++j){
    //             if (A[i][j] != 0){
    //                 countA++;
    //                 countB++;
    //             }
    //     }
    // }

    double (*sparseA)[3], (*sparseB)[3], (*sparseC)[3];
    sparseA = (double(*)[3])malloc(sizeof(*sparseA) * countA);
    sparseB = (double(*)[3])malloc(sizeof(*sparseB) * countB);
    sparseC = (double(*)[3])malloc(sizeof(*sparseC) * countA * countB);

    int count = 0;
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j){
                if (A[i][j] != 0){
                    sparseA[count][0] = i;
                    sparseA[count][1] = j;
                    sparseA[count][2] = A[i][j];
                    count++;
                }
        }
    }

    count = 0;
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j){
                if (B[i][j] != 0){
                    sparseB[count][0] = i;
                    sparseB[count][1] = j;
                    sparseB[count][2] = B[i][j];
                    count++;
                }
        }
    }


    printf("\n");
    printf("\n");
    for (int i = 0; i < countA; ++i) {
        for (int j = 0; j < 3; ++j){
                printf("%f ", sparseA[i][j]);
        }
        printf("\n");  
    }
    printf("\n");
    printf("\n");
    for (int i = 0; i < countB; ++i) {
        for (int j = 0; j < 3; ++j){
                printf("%f ", sparseB[i][j]);
        }
        printf("\n");  
    }
    printf("\n");
    printf("\n");


    count = 0;
    for (int i = 0; i < countA; ++i) {
        for (int j = 0; j < countB; ++j){
                if (sparseA[i][1] == sparseB[j][0] ){
                    sparseC[count][0] = sparseA[i][0];
                    sparseC[count][1] = sparseB[j][1];
                    sparseC[count][2] = sparseA[i][2] * sparseB[i][2];
                    count++;
                }
        }
    }


    for (int i = 0; i < countA; ++i) {
        for (int j = 0; j < countB; ++j){
                if (sparseA[i][1] == sparseB[j][0] ){
                    int row = sparseA[i][0];
                    int column = sparseB[j][1];
                    if (C[row][column] == 0){
                        C[row][column] = sparseA[i][2]*sparseB[j][2];
                    } else {
                        C[row][column] += sparseA[i][2]*sparseB[j][2];
                    }
                }
        }
    }


    // for (int i = 0; i < countA*countB; ++i) {
    //     for (int j = 0; j < 3; ++j){
    //         printf("%f ", sparseC[i][j]);
    //     }
    //     printf("\n");  
    // }
    // for (int i = 0; i < N; ++i) {
    //     printf("\n");
    //     for (int j = 0; j < N; ++j){
    //             printf("%f ", C[i][j]);
    //     }
    // }

  FILE *fp2 = fopen("reference.txt","w");
  for(int i = 0; i < N; i++) {
    fprintf(fp2,"\n");
    for(int j = 0; j < N; j++) {
      fprintf(fp2,"%lf ", C[i][j]);
    }
  }
  fclose(fp2);

    free(A);
    free(B);
    free(C);
    free(sparseA);
    free(sparseB);
    free(sparseC);
}




/*

#pragma omp parallel num_threads(4)

#pragma omp critical

printf("%f ", B[i][j]);
printf("%20s", "");

*/