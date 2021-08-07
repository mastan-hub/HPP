#include <stdio.h>
#include <stdlib.h>
#include "buttonread.h"

void randomWalk(buttonpress_2 * presses, int N);

int main(int argc, char **argv)
{
  printf("Size of the buttonpress_org struct: %lu\n", sizeof(buttonpress_org));
  printf("Size of the buttonpress_2 struct: %lu\n", sizeof(buttonpress_2));
  int numPresses;
  if(argc < 2)
    numPresses = 2000;
  else
    numPresses = atoi(argv[1]);

  buttonpress_org presses_org[numPresses];
  // Call buttonread function to fill presses_org with values
  int i;
  for(i = 0; i < numPresses; i++)
    {
      buttonread(&presses_org[i]);
    }

  // Copy values from presses_org to presses_2
  buttonpress_2 presses_2[numPresses];
  for(int repeat = 0; repeat < 100000; repeat++) {
    for(i = 0; i < numPresses; i++)
      {
	int leftright = presses_org[i].leftright;
	int updown = presses_org[i].updown;
	int held = presses_org[i].held;

#if 0
	char* p = (char*)&presses_2[i];
	/* LAB TASK: on the next line, instead of setting *p to zero,
	   do some bitwise operations involving "leftright", "updown",
	   and "held" in order to get the correct result. */
	*p = 0;
#else
	presses_2[i].leftright = leftright;
	presses_2[i].updown = updown;
	presses_2[i].held = held;
#endif
      }
  }

  // Verify that presses_2 now contains the same info as presses_org
  for(i = 0; i < numPresses; i++)
    {
      int errorCount = 0;
      if(presses_2[i].leftright != presses_org[i].leftright)
	errorCount++;
      if(presses_2[i].updown != presses_org[i].updown)
	errorCount++;
      if(presses_2[i].held != presses_org[i].held)
	errorCount++;
      if(errorCount != 0) {
	printf("ERROR: presses_2 does not contain same info as presses_org,\n");
	return -1;
      }
    }

  randomWalk(presses_2, numPresses);

  return 0;
}


//   unsigned int leftright : 2; 	// 00 none, 01 left, 10 right, 11 error
//   unsigned int updown : 2; 	// 00 none, 01 up, 10 down, 11 error
//   unsigned int held : 3;	// 1-8 steps

void randomWalk(buttonpress_2 * presses, int N)
{
  int i;
  int x = 0, y = 0, errors = 0;
  for(i=0; i<N; i++)
    {
      switch(presses[i].leftright){
      case 1:
	x -= presses[i].held+1; break;
      case 2:
	x += presses[i].held+1; break;
      case 3:
	errors += 1; break;
      }
      switch(presses[i].updown){
      case 1:
	y += presses[i].held+1; break;
      case 2:
	y -= presses[i].held+1; break;
      case 3:
	errors += 1; break;   
      }
    }
  printf("Final position: [%d, %d] with %d errors\n",x,y,errors); 
}
