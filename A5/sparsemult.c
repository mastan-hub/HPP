#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <math.h>
#include <omp.h>
#include <pthread.h>

#define nth 16

// Prints the matrix (Help function for developing the program).
void printMat(double *M, int N){
    for (int i = 0; i < N; ++i) {
        printf("\n");
        for (int j = 0; j < N; ++j){
            printf("%f ", M[i*N+j]);
        }
    }
    printf("\n\n");
}


// Prints the sparse matrix (Help function for developing the program).
void printSparse(double *M, int count){
    for (int i = 0; i < count; ++i) {
        for (int j = 0; j < 3; ++j){
            printf("%f ", M[3*i+j]);
        }
        printf("\n");  
    }
    printf("\n\n");
}


// Reads data from file and populates the matrix
void readFile(char* fname, double *A, int N){
    FILE *fp = fopen(fname, "r");
    while (!feof(fp))
    {
        for(int i=0; i<N; i++){
            for (int j=0; j<N; j++){
                if(fscanf(fp, "%lf", &A[i*N+j]));
            }
        }
    }
    fclose(fp);
}


// Write the data into a txt-file
void writeFile(char* fname, double *M, int N){
    FILE *fp = fopen(fname,"w");
    for(int i = 0; i < N; i++) {
        fprintf(fp,"\n");
        for(int j = 0; j < N; j++) {
            fprintf(fp,"%.4f ", M[i*N+j]);
        }
    }
    fclose(fp);
}


// Counts the number of non-zero elements. For input used a pointer to the matrix and size of the matrix.
int nonZeroCount(double *M, int N){
    int i,j;
    int count = 0;
    #pragma omp parallel for reduction (+: count)
    for (i = 0; i < N; ++i) {
        for (j = 0; j < N; ++j){
            if (M[i*N+j] != 0){
                count++;
            }
        }
    }
    return count;
}


// Multiplies two matrices A and B and saves the result in matrix C.
void matmult(double *C, double *A, double *B, int N){
    int i,j,k;
    #pragma omp parallel for private(i,j,k) shared(A,B,C)
    for (i = 0; i < N; ++i){
        for (j = 0; j < N; ++j){
            for (k = 0; k < N; ++k){
                C[i*N+j] += A[i*N+k] * B[k*N+j];
            }
        }
    }
}


void sparsifyA(double *M, double *sparseM, int N){
    int count = 0;
    int i, j;
    #pragma omp parallel for private(i,j) shared(M)
    for (j = 0; j < N; ++j){
        for (i = 0; i < N; ++i) {
            if (M[i*N+j] != 0){
                sparseM[3*count] = i;
                sparseM[3*count+1] = j;
                sparseM[3*count+2] = M[i*N+j];
                count++;
            }
        }
    }
}


// Saves the matrix as sparse matrix and frees the memory.
void sparsifyB(double *M, double *sparseM, int N){
    int count = 0;
    int i, j;
    #pragma omp parallel for private(i,j) shared(M)
    for (i = 0; i < N; ++i) {
        for (j = 0; j < N; ++j){
            if (M[i*N+j] != 0){
                sparseM[3*count] = i;
                sparseM[3*count+1] = j;
                sparseM[3*count+2] = M[i*N+j];
                count++;
            }
        }
    }
}


// Multiplies the two sparse matrix A and B and saves the result in C.
void sparseMatmult(double *C, double *sparseA, double *sparseB, int nzA, int nzB, int N){
    #pragma omp parallel
    {
        int i,j, cash = 0, newcash = 0;
        #pragma omp for private(i, j) schedule(static, ((nzA/nth)/N))
        for (i = 0; i < nzA; ++i){
            if (sparseA[i*3+1] > sparseA[((i-1)*3)+1]){
                cash = newcash;
            }
            j = cash;
            while (j < nzB){
                if(sparseA[i*3+1] == sparseB[j*3]){
                    #pragma omp atomic
                    C[(int) (sparseA[i*3]*N+sparseB[j*3+1])] += sparseA[i*3+2]*sparseB[j*3+2];
                } else if (sparseB[j*3] > sparseA[i*3+1]){
                    newcash = j;
                    break;
                }
                j++;
            }
        }
    }
    free(sparseA);
    free(sparseB);
}
  


int main()
{
    // Time Variables
    struct timeval tv1, tv2;
    struct timezone tz;
	double elapsed;

    // 64  128  256  512  1024  2048  4096  8192  16384  
    int N = 8192;               // Size of the matrix
    int nzA = 0;                // Non-zero elements of matrix A
    int nzB = 0;                // Non-zero elements of matrix B
    double densRatioA = 0;          // density ratio of the matrix A
    double densRatioB = 0;          // density ratio of the matrix B

    // Initializing matrix variables
    double (*A)[N], (*B)[N], (*C)[N], (*sparseA)[3], (*sparseB)[3];


    // Reading the values from files and populating matrices A and B.
    A = (double(*)[N])malloc(sizeof(*A) * N);
    B = (double(*)[N])malloc(sizeof(*B) * N);
    C = (double(*)[N])malloc(sizeof(*C) * N);
    #pragma omp parallel sections
    {
        #pragma omp section
        {
            readFile("A-8192.txt", *A, N);
        }
        #pragma omp section
        {
            readFile("B-8192.txt", *B, N);
        }
    }

    
    // Setting number of processing elemnts to be used.
    // omp_set_num_threads(omp_get_num_procs());
    omp_set_num_threads(nth);

    // Start taking the time for the multiplication.
    gettimeofday(&tv1, &tz);

    // Counting how many non-zero elements there are in each of the matrices A and B.
    #pragma omp parallel sections
    {
        #pragma omp section
        {
            nzA = nonZeroCount(*A, N);
            densRatioA = (double) nzA / ((double) N * (double) N);
        }
        #pragma omp section
        {
            nzB = nonZeroCount(*B, N);
            densRatioB = (double) nzA / ((double) N * (double) N);
        }
    }

    

    // Check if the matrix is sparse
    if ( (densRatioA <= 0.5) || (densRatioB <= 0.5))
    {
        // Changing the matrices A and B to sparse formate.
        sparseA = (double(*)[3])malloc(sizeof(*sparseA) * nzA);
        sparseB = (double(*)[3])malloc(sizeof(*sparseB) * nzB);
        #pragma omp parallel sections
        {
            #pragma omp section
            {
                sparsifyA(*A, *sparseA, N);
            }
            #pragma omp section
            {
                sparsifyB(*B, *sparseB, N);
            }
        }
        // Multiplying the two sparse matrices sparseA and sparseB and saving the result in matric C.
        sparseMatmult(*C, *sparseA, *sparseB, nzA, nzB, N);
    } else {
        // Ordinary multiplication of the matrices
        matmult(*C, *A, *B, N);
    }


    // Stop taking the time and printing the time.
    gettimeofday(&tv2, &tz);
    elapsed = (double) (tv2.tv_sec-tv1.tv_sec) + (double) (tv2.tv_usec-tv1.tv_usec) * 1.e-6;
    printf("elapsed time = %f seconds.\n", elapsed);
    printf("Number of cores used = %d \n", nth);
    printf("Matrix Size = %d \n", N);
    printf("Matrix Size = %d \n", nzA);

    // Writing the content of matrix C (result), in a txt-file to be checked against the reference file.
    writeFile("reference.txt", *C, N);


    // Freeing the used memory.
    free(A); free(B); free(C);
}