#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>

double** alloc_matrix(int N);
void dealloc_matrix(double** matrix, int N);
int read_data(double **grid, char *filename, int M);
int get_m(int l);
void fill_f(double **matrix, int M, double h);
double L1_norm(double **matrix, int M);
double L2_norm(double **matrix, int M);
double Max_norm(double **matrix, int M);
void multigrid_vcycle(int level, double **u, double **f, double h, double r0);
void L_def(double **matrix_u, double **matrix_v, double **matrix_f, int M);
void GS_update(double **matrix_u, double **matrix_f, int M);
void set_BC(double **matrix, int M);
void res_R(double **matrix_d, double **matrix_d_small, int M);
void prol_P(double **Mat_small, double **Mat_big, int M_big, int M_small);
void u_update(double **matrix_u, double **matrix_v, int M);
void set_zeros(double **matrix, int M);
int verify(double **result, double **given, int M);
void print_matrix(double **matrix, int M);

const int l = 9;

const double pi = 3.141592653589793;
const double epsilon = 1e-5;

int main() {

	double r0;
	double **u, **f, **comp;

	// Definitions
	const double m = get_m(l);
	const double h = 1/m;
	const int N = m+1;							// Matrix size

	char filename[7] = "mg.dat";

	struct timeval start, end;	


	// Matrix allocations
	comp = alloc_matrix(N);
	u = alloc_matrix(N);
	f = alloc_matrix(N);

	// Read given data to compare result
	read_data(comp, filename, N);

	fill_f(f, N, h);							// Forcing function

	//r0 = L1_norm(f, N);						// L1 norm (absolute norm) of initial residual
	r0 = L2_norm(f, N);							// L2 norm of initial residual
	//r0 = Max_norm(f, N);						// Max norm of initial residual

	gettimeofday(&start, NULL);					// Initializing timing of the program

	multigrid_vcycle(l, u, f, h, r0);

	// Get the time of the program
	gettimeofday(&end, NULL);

	//printf("\nReading gridfunction of size %d x %d from file %s\n\n",N,N,filename);
	//print_matrix(comp, N);
	//printf ("\nResult\n\n");
	//print_matrix(u, N);

	if (verify(u, comp, N))
		printf ("\nResult OK!\n");
	else
		printf ("\nResult not OK!\n");

	printf("time = %lf s\n", ((end.tv_sec + end.tv_usec/1000000.0) - (start.tv_sec + start.tv_usec/1000000.0)));

	dealloc_matrix(comp, N);
	dealloc_matrix(u, N);
	dealloc_matrix(f, N);

	return 0;
}

void multigrid_vcycle(int level, double **u, double **f, double h, double r0) {

	int Nbig, Nsmall;
	double Luf0;
	double **d_big, **d_small, **v_big, **v_small;
			
	Nbig = get_m(level)+1;												// Get the big matrix size
	Nsmall = get_m(level-1)+1;											// Get the small matrix size

	if (level == 1) {
		u[1][1] = h*h*f[1][1];
	}
	else {
		
		d_big = alloc_matrix(Nbig);										// Allocate new matrix
		d_small = alloc_matrix(Nsmall);									// Allocate new matrix
		v_big = alloc_matrix(Nbig);										// Allocate new matrix
		v_small = alloc_matrix(Nsmall);									// Allocate new matrix

		Luf0 = r0;														// Force the while

		while (Luf0/r0 > epsilon) {

			GS_update(u, f, Nbig);										// Gauss Seidel update
			
			L_def(u, d_big, f, Nbig);									// Compute the defect

			res_R(d_big, d_small, Nsmall);								// Restricting the defect

			multigrid_vcycle(level-1, v_small, d_small, h, r0); 

			prol_P(v_big, v_small, Nbig, Nsmall);

			u_update(u, v_big, Nbig);									// Update u
			GS_update(u, f, Nbig);										// Gauss Seidel update

			//Luf0 = L1_norm(d_big, Nbig); 
			Luf0 = L2_norm(d_big, Nbig);
			//Luf0 = Max_norm(d_big, Nbig);
		}
 
		dealloc_matrix(d_big, Nbig);
		dealloc_matrix(d_small, Nsmall);
		dealloc_matrix(v_big, Nbig);
		dealloc_matrix(v_small, Nsmall);
	}
}

double** alloc_matrix(int M) {
  double** matrix;
  int i;

  matrix = (double**)malloc(M*sizeof(double*));
  
  for(i=0; i<M; i++)
    matrix[i] = (double*)calloc(M, sizeof(double));
  
  return matrix;
}

void dealloc_matrix(double** matrix, int M) {
  int i;

  for (i=0; i < M ; i++)
    free(matrix[i]);
  		free(matrix);
}

int read_data(double **grid, char *filename, int M) {
	
	int i, j, element_counter;
	FILE *myfile;
	
	myfile = fopen(filename,"r");

	if( myfile == NULL ) {
		return -1; 
	}

	element_counter = 0;
	
	for(i=0;i<M;i++) {   
		for(j=0;j<M;j++) {
			element_counter += fscanf(myfile,"%lf\n",&grid[i][j]);
		}
	}
	return 1;
}

int get_m(int l) {
	int i;
	int m = 1;

	for (i=1; i<=l; i++)
		m = m*2;

	return m;
}

void fill_f(double **matrix, int M, double h) {
	int i, j;
	//double temp;
	printf ("\n\n");
	for (i=0; i<M; i++) {
		//temp = sin(pi*i*h)*sin(sqrt(2)*pi*i*h);
		for (j=0; j<M; j++) {
			matrix[i][j] = h*h*sin(pi*j*h)*sin(sqrt(3)*pi*j*h) * sin(pi*i*h)*sin(sqrt(2)*pi*i*h);
		}
	}
}

double L1_norm(double **matrix, int M) {
	int i, j;
	double l1_norm=0;

	for (i=0; i<M; i++) {
		for (j=0; j<M; j++) {
			l1_norm += fabs(matrix[i][j]);
		}
	}
	return l1_norm;
}

double L2_norm(double **matrix, int M) {
	int i, j;
	double l2_norm, sum=0;

	for (i=0; i<M; i++) {
		for (j=0; j<M; j++) {
			sum += matrix[i][j]*matrix[i][j];
		}
	}
	l2_norm = sqrt(sum);

	return l2_norm;
}

double Max_norm(double **matrix, int M) {
	int i, j;
	double max_norm;

	max_norm = matrix[0][0];
	for (i=0; i<M; i++) {
		for (j=0; j<M; j++) {
			if (max_norm < fabs(matrix[i][j]))
				max_norm = fabs(matrix[i][j]);
		}
	}
	return max_norm;
}

void L_def(double **matrix_u, double **matrix_v, double **matrix_f, int M) {
	int i, j;

	for (i=1; i<M-1; i++) {
		for (j=1; j<M-1; j++) {
			matrix_v[i][j] = 4.0*matrix_u[i][j]-matrix_u[i-1][j]-matrix_u[i+1][j]-matrix_u[i][j-1]-matrix_u[i][j+1] - matrix_f[i][j];
		}
	}
}

void GS_update(double **matrix_u, double **matrix_f, int M) {
	int i, j;

	for (i=1; i<M-1; i++) {
		for (j=1; j<M-1; j++) {
			matrix_u[i][j] = 1.0/4.0*(matrix_u[i-1][j]+matrix_u[i+1][j]+matrix_u[i][j-1]+matrix_u[i][j+1] + matrix_f[i][j]);
		}
	}
}

void set_BC(double **matrix, int M) {
	int i;

	for (i=0; i<M; i++) {
		matrix[0][i] = 0;
		matrix[M-1][i] = 0;
		matrix[i][0] = 0;
		matrix[i][M-1] = 0;
	}
}

void res_R(double **matrix_d, double **matrix_d_small, int M) {
	int i, j;

	for (i=0; i<M; i++) {
		for (j=0; j<M; j++) {
			matrix_d_small[i][j] = 4*matrix_d[2*i][2*j];
		}
	}
}

void prol_P(double **Mat_big, double **Mat_small, int M_big, int M_small) {
	int i, j;

	for (i=0; i<M_big; i++) {
		for (j=0; j<M_big; j++) {
			Mat_big[i][j] = 0;
		}
	}

	for (i=0; i<M_small-1; i++) {
		for (j=0; j<M_small-1; j++) {
			Mat_big[2*i][2*j] = Mat_small[i][j];
			Mat_big[2*i+1][2*j] = 1.0/2.0*(Mat_small[i][j]+Mat_small[i+1][j]);
			Mat_big[2*i][2*j+1] = 1.0/2.0*(Mat_small[i][j]+Mat_small[i][j+1]);
			Mat_big[2*i+1][2*j+1] = 1.0/4.0*(Mat_small[i][j]+Mat_small[i][j+1]+Mat_small[i+1][j]+Mat_small[i+1][j+1]);
		}
	}
}

void u_update(double **matrix_u, double **matrix_v, int M) {
	int i, j;

	for (i=0; i<M; i++) {
		for (j=0; j<M; j++) {
			matrix_u[i][j] = matrix_u[i][j] - matrix_v[i][j];
		}
	}
}

void set_zeros(double **matrix, int M) {
	int i, j;
	for (i=0; i<M; i++) {
		for (j=0; j<M; j++) {
			matrix[i][j] = 0.0;
		}
	}
}

int verify(double **result, double **given, int M) {
	int i, j;

	for (i=0; i<M; i++) {
		for (j=0; j<M; j++) {
			if (fabs(result[i][j]-given[i][j]) > 1e-5)
				return 0;
		}
	}
	return 1;
}

void print_matrix(double **matrix, int M) {
	int i, j;

	for (i=0; i<M; i++) {
		for (j=0; j<M; j++) {
			printf ("%lf ", matrix[i][j]);
		}
		printf ("\n");
	}
}
