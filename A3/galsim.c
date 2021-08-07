#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h> 

//typedef double double;

typedef struct body {
  double X, Y, Mass, dX, dY, Brightness;
} body;

int main(int argc, char * argv[]) {
  int NParticles;
  char* Filename;
  int NSteps;
  double DeltaT;
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
  double e0 = 1e-3;
  printf("DeltaT : %f\ne0 : %f\n", DeltaT, e0);

  //body *Bodies = 0;
  body *Bodies = malloc(NParticles * sizeof(body));

  // Read particle data from file 
  FILE* FileToRead = fopen(Filename, "rb");
  
  double temp;

  for (int i = 0; i < NParticles; ++i)  {
    fread(&(Bodies[i].X), sizeof(double), 1, FileToRead);
    //Bodies[i].X = (double)temp;
    fread(&(Bodies[i].Y), sizeof(double), 1, FileToRead);
    //Bodies[i].Y = (double)temp;
    fread(&(Bodies[i].Mass), sizeof(double), 1, FileToRead);
    //Bodies[i].Mass = (double)temp;
    fread(&(Bodies[i].dX), sizeof(double), 1, FileToRead);
    //Bodies[i].dX = (double)temp;
    fread(&(Bodies[i].dY), sizeof(double), 1, FileToRead);
    //Bodies[i].dY = (double)temp;
    fread(&(Bodies[i].Brightness), sizeof(double), 1, FileToRead);
    //Bodies[i].Brightness = (double)temp;
  }
  fclose(FileToRead);
  /*
  // To print all the particles after read.
  for (int i = 0; 
       i < NParticles;
       ++i) {
    printf("Body %d:\nPos : (%f, %f)\nVel : (%f, %f)\nMass, brightness : %f -- %f\n",i, Bodies[i].X, Bodies[i].Y, Bodies[i].dX, Bodies[i].dY, Bodies[i].Mass, Bodies[i].Brightness);
  }
  */

  body *N = malloc(NParticles*sizeof(body));
  //body * Nplus;
  body *Nplus = malloc(NParticles*sizeof(body));

 double ax, ay, xi, xj, yi, yj, ffx, ffy, m;
 // double ay = 0;
 // double xi = 0;
 // double xj = 0;
 // double yi = 0;
 // double yj = 0;
 // double ffx;
 // double ffy;
 // double m = 0;
  // printf("1 : (%3.5f, %3.5f)\t2 : (%3.5f, %3.5f)\n", Bodies[0].X, Bodies[0].Y, Bodies[1].X, Bodies[1].Y);
  for (int t = 0; t < NSteps; ++t) {
    for (int i = 0; i < NParticles; ++i) {
      ax = 0;
      ay = 0;
      xi = N[i].X;
      yi = N[i].Y;


      //double tempx = 0;
      //double tempy = 0;
      for (int j = 0; j < NParticles; ++j) {
	      //if (i != j) {

        xj = N[j].X;
        yj = N[j].Y;
        m = N[j].Mass;
        double DiffX = xi-xj;
        double DiffY = yi-yj;
        double rij = sqrt(DiffX+DiffY);
        double denom = (rij + e0)*(rij + e0)*(rij + e0);

        double ffx = (m/denom)*DiffX;
        double ffy = (m/denom)*DiffY;


        // double DiffX = Bodies[i].X - Bodies[j].X;
        // double DiffY = Bodies[i].Y - Bodies[j].Y;
        // double rij = sqrt(DiffX*DiffX + DiffY*DiffY);
        // double denom = (rij + e0);
        // denom = denom*denom*denom;

        // tempx += (Bodies[j].Mass / denom) * DiffX;
        // tempy += (Bodies[j].Mass / denom) * DiffY;
	     //} 
      }
      ax = -G*ffx;
      ay = -G*ffy;
      //ax = -G*tempx;
      //tempx = 0;
      //ay = -G*tempy;
      //tempy = 0;
      Nplus[i].dX = N[i].dX + DeltaT*ax;
      Nplus[i].dY = N[i].dY + DeltaT*ay;

      Nplus[i].X = xi + DeltaT*Nplus[i].dX;
      Nplus[i].Y = yi + DeltaT*Nplus[i].dY;

      (Nplus[i].Mass) = (N[i].Mass);
      (Nplus[i].Brightness) = (N[i].Brightness);
      //Bodies[i].dX += DeltaT * ax;
      //Bodies[i].dY += DeltaT * ay;

      //Bodies[i].X += DeltaT * Bodies[i].dX;	
      //Bodies[i].Y += DeltaT * Bodies[i].dY;
    }
    // printf("1 : (%3.5f, %3.5f)\t2 : (%3.5f, %3.5f)\n", Bodies[0].X, Bodies[0].Y, Bodies[1].X, Bodies[1].Y);
    memcpy (Bodies, Nplus, NParticles*sizeof(body));
 }

  
  char* OutputFilename = "result.gal";
  FILE* FileToWrite = fopen(OutputFilename, "wb");
  
  for (int i = 0;i < NParticles; ++i) {
    //temp = (double)Bodies[i].X;
    fwrite(&(Bodies[i].X), sizeof(double), 1, FileToWrite);
    //temp = (double)Bodies[i].Y;
    fwrite(&(Bodies[i].Y), sizeof(double), 1, FileToWrite);
    //temp = (double)Bodies[i].Mass;
    fwrite(&(Bodies[i].Mass), sizeof(double), 1, FileToWrite);
    //temp = (double)Bodies[i].dX;
    fwrite(&(Bodies[i].dX), sizeof(double), 1, FileToWrite);
    //temp = (double)Bodies[i].dY;
    fwrite(&(Bodies[i].dY), sizeof(double), 1, FileToWrite);
    //temp = (double)Bodies[i].Brightness;
    fwrite(&(Bodies[i].Brightness), sizeof(double), 1, FileToWrite);
  }
  fclose(FileToWrite);
  free(Bodies);
  free(Nplus);
  free(N);
}
