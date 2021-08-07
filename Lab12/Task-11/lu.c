#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define MIN(X,Y) ((X) < (Y) ? (X) : (Y))


int main(int argc, char *argv[]) {
   	

	double **A;
	int n,i,j,k,m;
   	double t,error,d,time;

   	if (argc!=2){
        printf("Use: ./lu n\n");
        return 0;
   	}
   	n = atoi(argv[1]);
  
   	//Allocate and fill the matrix
   	A = (double **)malloc(n*sizeof(double *));
   	for(i=0;i<n;i++){
      A[i] = (double *)malloc(n*sizeof(double));
    }

  	for (i = 0; i<n; i++){
	  for(j=0;j<n;j++){
		  A[i][j] = 1.0/(i+j+1);
      }
	}
    
		  
    // Factorize A=L*U (In situ, no pivoting)
	for(k=0;k<n;k++){
		{
			for (i=k+1;i<n;i++){		
				 A[i][k]=A[i][k]/A[k][k];
			}
			for (i=k+1;i<n;i++){
				for (j=k+1;j<n;j++){		
					A[i][j]=A[i][j]-A[i][k]*A[k][j];	
				}
			}
		}		
	}
		  	
	// Correctness check (L*U-A)
	error=0.0;
	for (i=0;i<n;i++)
		for (j=0;j<n;j++){
			d=0.0;
			m=MIN(i,j);
			for (k=0;k<m;k++)
				d+=A[i][k]*A[k][j];
			if (i==m)
				d+=A[m][j];
			else 
				d+=A[i][m]*A[m][j];
			error+=fabs(d-1.0/(i+j+1));
		}
	printf("Error: %e \n",error);
			

   	for(i = 0; i < n; ++i){	     
		free(A[i]);		 
   	}
   	free(A);

   	return 0;
   
}
