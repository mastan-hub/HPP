#include <stdio.h>

int main(int argc, char** argv) {

#pragma omp parallel num_threads(5)
  {
    printf("Bonjour!\n");
  }

  return 0;
}


/*

With out any optimization:

real    0m5,530s
user    0m5,467s
sys     0m0,008s


N = 35;
real    0m2,544s
user    0m2,493s
sys     0m0,004s


real    0m13,098s
user    0m12,889s
sys     0m0,016s

real    0m0,679s
user    0m0,665s
sys     0m0,004s
*/