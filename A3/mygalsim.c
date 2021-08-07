#include <stdio.h>
#include <stdlib.h>   //for malloc etc
#include <math.h>
#include <string.h>   //for memcpy


//we could probably store these as floats instead, but I have not figured out how to yet
typedef struct particle {
   double x, y, mass, vx, vy, brightness;
} particle_t;

//a function that reads the positions, velocities, mass and brightness of every particle and puts it in an array.
void read_input(int N, char *filename, particle_t *arr) {
        FILE *file;
        file = fopen(filename,"rb");

        if (file) {
                int i;
                for (i = 0; i<N; i++) {
                        //putting in the positions etc
                        fread(&(arr[i].x), sizeof(double), 1, file);     //read x-pos
                        fread(&(arr[i].y), sizeof(double), 1, file);     //read y-pos
                        fread(&(arr[i].mass), sizeof(double), 1, file);  //read mass
                        fread(&(arr[i].vx), sizeof(double), 1, file);    //read x-velocity
                        fread(&(arr[i].vy), sizeof(double), 1, file);    //read y-velocity
                        fread(&(arr[i].brightness), sizeof(double), 1, file);  //read brigthness
                }
        }
        fclose(file);  //closing the file
}

void write_output(int N, char *filename, particle_t *arr) {
        FILE *file;
        file = fopen(filename,"wb");

        if (file) {
                int i;
                for (i = 0; i<N; i++) {
                        //writing in the positions etc
                        fwrite(&(arr[i].x), sizeof(double), 1, file);     //write x-pos
                        fwrite(&(arr[i].y), sizeof(double), 1, file);     //write y-pos
                        fwrite(&(arr[i].mass), sizeof(double), 1, file);  //write mass
                        fwrite(&(arr[i].vx), sizeof(double), 1, file);    //write x-velocity
                        fwrite(&(arr[i].vy), sizeof(double), 1, file);    //write y-velocity
                        fwrite(&(arr[i].brightness), sizeof(double), 1, file);  //write brigthness
                }
        }
        fclose(file);  //closing the file
}

//function to change the speed and position for every particle. To optimize it we should calculate the acceleration, speed and new position
//for the same particle before moving on to the new, but we should save it into another array and then later use the new array instead of the old
//because if we change it ditrectly the calculations for the next particle will be slightly wrong.
static inline void next_state(int N, float G, float delta_t, particle_t * __restrict current_state, particle_t * __restrict next) {  //use inline since its a function in a loop
        int i;
        int j;
        //these should be unrolled or use lab8 or someting similar later
        double xi, xj, yi, yj, mj, x_dist, y_dist, rij, r3, mjr3;
        const float epsilon = 1e-3;  //1e-3
        for (i = 0; i < N; i++) {
                //calculates the acceleration because we never need the force explicitly
                double ax = 0;
                double ay = 0;
                xi = (current_state[i].x);
                yi = (current_state[i].y);

                //we ignore the if-statement since xi-xi = yi-yi = 0 and since epsilon is non-zero we will not divide by zero
                for (j = 0; j < N; j++) {
                   //storing relevant variables
                   xj = (current_state[j].x);
                   yj = (current_state[j].y);
                   mj = (current_state[j].mass);
                   rij = sqrt((xi-xj)*(xi-xj) + (yi-yj)*(yi-yj));
                   //calculating the force, this must be improved later
                   r3 = (rij + epsilon)*(rij + epsilon)*(rij + epsilon);
                   //to avoid division twice:
                   mjr3 = mj/r3;
                   //the acceleration
                   ax += mjr3*(xi-xj);
                   ay += mjr3*(yi-yj);
                }

                //multiplying in the outer loop part to get force, but if we divide with mass we get the acceleration directly
                ax *= -G;
                ay *= -G;
                //calculating the velocity
                (next[i].vx) = (current_state[i].vx) + delta_t*ax;
                (next[i].vy) = (current_state[i].vy) + delta_t*ay;
                //calculating the new position
                (next[i].x) = xi + delta_t*(next[i].vx);
                (next[i].y) = yi + delta_t*(next[i].vy);
                //fixing the mass and brightness
                (next[i].mass) = (current_state[i].mass);
                (next[i].brightness) = (current_state[i].brightness);
            }
}

int main(int argc, char * argv[]) {
        int N = atoi(argv[1]);
        char* filename = argv[2];
        int nsteps = atoi(argv[3]);
        float delta_t = atof(argv[4]);    //1e-5
        int graphics = atoi(argv[5]);

        if (argc != 6) {
                printf("Expected 5 parameters, recieved %d", argc-1);
                return 0;
        }

        const float G = 100.0/N;

        //allocating memory for array, the memory will be freed later
        particle_t *arr = malloc(N*sizeof(particle_t));
        particle_t *next = malloc(N*sizeof(particle_t));

        //reading the input
        read_input(N, filename, arr);

        //performing the time-loop:
        int t;
        for (t=0; t<nsteps; t++) {
                next_state(N, G, delta_t, arr, next);
                memcpy(arr, next, N*sizeof(particle_t));   //need to make a deep-copy, not just assigning
        }

        char filename2[] = "output.gal";
        write_output(N, filename2, arr);

        //freeing the memory
        free(arr);
        free(next);

}
