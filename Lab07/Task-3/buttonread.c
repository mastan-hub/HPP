#include <stdio.h>
#include <stdlib.h>
#include "buttonread.h"

//   unsigned int leftright : 2; 	// 00 none, 01 left, 10 right, 11 error
//   unsigned int updown : 2; 	// 00 none, 01 up, 10 down, 11 error
//   unsigned int held : 3;	// 1-8 steps

void buttonread(buttonpress_org* press)
{
  int lr = rand() % 3;
  int ud = rand() % 3;
  int h = rand() % 8;

  press->leftright = lr;
  press->updown = ud;
  press->held = h;
}
