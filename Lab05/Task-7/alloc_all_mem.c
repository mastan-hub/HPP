/* Experiment to see some effect of the virual memory system -- when
   the coputer runs out of physical memory, memory access becomes very
   slow because of swapping (parts of memory contents written to disk
   to free up some of the physical memory). */

#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>
#include <stdio.h>

static double get_wall_seconds() {
  struct timeval tv;
  gettimeofday(&tv, NULL);
  double seconds = tv.tv_sec + (double)tv.tv_usec / 1000000;
  return seconds;
}

int main(int argc, char* argv[]) {
  const long int bufSz = 10000;
  const long int nBufs = 5000000;
  long int totNoOfBytes = bufSz * nBufs;
  double totNoOfGB = (double)totNoOfBytes / 1e9;
  double single_alloc_time_limit = 0.01;
  printf("This program will attempt to allocate and use memory buffers of size "
	 "%ld bytes, up to a total size of %7.2f GB, breaking when it detects "
	 "that allocation of a buffer takes longer than %6.3f wall seconds.\n",
	 bufSz, totNoOfGB, single_alloc_time_limit);
  char** ptrList = (char**)malloc(nBufs*sizeof(char*));
  for(int i = 0; i < nBufs; i++)
    ptrList[i] = NULL;
  double saved_time = get_wall_seconds();
  double time_taken_min = 1000000;
  double time_taken_max = 0;
  double stoppingTime = 0;
  size_t bytes_allocated_so_far = 0;
  int stop_soon = 0;
  for(int i = 0; i < nBufs; i++) {
    double time1 = get_wall_seconds();
    // Allocate buffer and put some data there
    ptrList[i] = (char*)malloc(bufSz);
    for(int j = 0; j < bufSz; j++)
      ptrList[i][j] = 77;
    // Keep track of total number of bytes allocated
    bytes_allocated_so_far += bufSz;
    double time_taken = get_wall_seconds() - time1;
    // Update min and max time taken
    if(time_taken < time_taken_min)
      time_taken_min = time_taken;
    if(time_taken > time_taken_max)
      time_taken_max = time_taken;
    // Print an output message every second
    if(get_wall_seconds() - saved_time > 1.0) {
      double GB_tot = (double)bytes_allocated_so_far / (double)1e9;
      printf("time_taken_min = %9.7f  time_taken_max = %9.7f wall seconds  GB_tot = %7.2f GB\n", time_taken_min, time_taken_max, GB_tot);
      saved_time = get_wall_seconds();
    }
    // Check if any single allocation has taken longer time than the allowed limit
    if(stop_soon == 0 && time_taken_max > single_alloc_time_limit) {
      printf("Slow time detected -- will try to stop in 3 seconds.\n");
      stoppingTime = get_wall_seconds() + 3;
      stop_soon = 1;
    }
    if(stop_soon == 1 && get_wall_seconds() > stoppingTime) {
      printf("Stopping now!\n");
      break;
    }
  }
  // Free memory
  printf("Freeing memory...\n");
  for(int i = 0; i < nBufs; i++) {
    if(ptrList[i] != NULL)
      free(ptrList[i]);
  }
  free(ptrList);
  printf("Done!\n");
  return 0;
}
