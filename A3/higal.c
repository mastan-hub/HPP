#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h> 


typedef struct body {
  double X, Y, Mass, dX, dY, Brightness;
} body;


static inline void euler(int NParticles, double G, float DeltaT, float e0, body *N, body *Nplus){
  double ax, ay, DiffX, DiffY, rij, denom, ffx, ffy, m;
  for (int i = 0; i < NParticles; ++i) {
     ax = 0;
     ay = 0;
     for (int j = 0; j < NParticles; ++j) {
        if (i != j) {
            DiffX = (N[i].X - N[j].X);
            DiffY = (N[i].Y - N[j].Y);
            rij = sqrt(DiffX+DiffY);
            denom = (rij + e0)*(rij + e0)*(rij + e0);
            ffx = (N[j].Mass / denom)*DiffX;
            ffy = (N[j].Mass / denom)*DiffY;
           }
       }
     ax = -G*ffx;
     ay = -G*ffy;

     Nplus[i].dX = N[i].dX + DeltaT*ax;
     Nplus[i].dY = N[i].dY + DeltaT*ay;

     Nplus[i].X = N[i].X + DeltaT*Nplus[i].dX;
     Nplus[i].Y = N[i].Y + DeltaT*Nplus[i].dY;

     (Nplus[i].Mass) = (N[i].Mass);
     (Nplus[i].Brightness) = (N[i].Brightness);
    }
}


int main(int argc, char * argv[]) {
  int NParticles;
  char* Filename;
  int NSteps;
  float DeltaT;
  int Graphics;
  if (argc < 6) {
    printf("Expected input args: N filename nsteps delta_t graphics.\n");
    return 0;
  } else {
    NParticles = atoi(argv[1]);
    Filename = argv[2];
    NSteps = atoi(argv[3]);
    DeltaT = atof(argv[4]);
    Graphics = atoi(argv[5]);
  }

  double G = 100.0 / NParticles;
  float e0 = 1e-3;
  printf("DeltaT : %f\ne0 : %f\n", DeltaT, e0);

  body *Bodies = malloc(NParticles * sizeof(body));
  body *Nplus = malloc(NParticles * sizeof(body));

  FILE* FileToRead = fopen(Filename, "rb");

  for (int i = 0; i < NParticles; ++i)  {
      fread(&(Bodies[i].X), sizeof(double), 1, FileToRead);
      fread(&(Bodies[i].Y), sizeof(double), 1, FileToRead);
      fread(&(Bodies[i].Mass), sizeof(double), 1, FileToRead);
      fread(&(Bodies[i].dX), sizeof(double), 1, FileToRead);
      fread(&(Bodies[i].dY), sizeof(double), 1, FileToRead);
      fread(&(Bodies[i].Brightness), sizeof(double), 1, FileToRead);
  }
  fclose(FileToRead);

  for (int t = 0; t < NSteps; ++t) {
      euler(NParticles, G, DeltaT, e0, Bodies, Nplus);
      memcpy (Bodies, Nplus, NParticles*sizeof(body));
    }

  char* OutputFilename = "resulttt.gal";
  FILE* FileToWrite = fopen(OutputFilename, "wb");
  
  for (int i = 0;i < NParticles; ++i) {
    fwrite(&(Bodies[i].X), sizeof(double), 1, FileToWrite);
    fwrite(&(Bodies[i].Y), sizeof(double), 1, FileToWrite);
    fwrite(&(Bodies[i].Mass), sizeof(double), 1, FileToWrite);
    fwrite(&(Bodies[i].dX), sizeof(double), 1, FileToWrite);
    fwrite(&(Bodies[i].dY), sizeof(double), 1, FileToWrite);
    fwrite(&(Bodies[i].Brightness), sizeof(double), 1, FileToWrite);
  }
  fclose(FileToWrite);
  free(Bodies);
  free(Nplus);
}



