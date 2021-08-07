#ifndef BUTTONREAD_H
#define BUTTONREAD_H

typedef struct {
  unsigned int leftright; // 00 none, 01 left, 10 right, 11 error
  unsigned int updown;    // 00 none, 01 up, 10 down, 11 error
  unsigned int held;	  // 1-8 steps
} buttonpress_org;

typedef struct {
  unsigned int leftright : 2; 	// 00 none, 01 left, 10 right, 11 error
  unsigned int updown : 2; 	// 00 none, 01 up, 10 down, 11 error
  unsigned int held : 3;	// 1-8 steps
} buttonpress_2;

void buttonread(buttonpress_org* press);

#endif
