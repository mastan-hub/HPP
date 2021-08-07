#include <pmmintrin.h>   /* SSE3 */
#include <immintrin.h> 
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

typedef char Type;
#define VECT_LEN 32   /* the length of the vector */

//void copy_vect ( Type * dst, const Type* src, size_t len)
//{
//  int i;
//  /* length of the array must be a multiple of the vector size VECT_LEN */
//  for(i = 0; i < len; i += VECT_LEN )
//    {
//      __m128i v = _mm_loadu_si128((__m128i *) (src+i));
//      _mm_storeu_si128((__m128i *)(dst+i), v);
//    }
//}

void copy_vect ( Type * dst, const Type* src, size_t len)
{
  int i;
  /* length of the array must be a multiple of the vector size VECT_LEN */
  for(i = 0; i < len; i += VECT_LEN )
    {
      __m256i v = _mm256_loadu_si256((__m256i *) (src+i));
      _mm256_storeu_si256((__m256i *)(dst+i), v);
    }
}

int main()
{
  const int N = 160000;
  Type src1[N], src2[N], dst[N];
  /* Initialize src1 vector with some random numbers. */
  int i;
  for(i = 0; i < N; i++)
    src1[i] = rand() % 50;
  /* Copy data to src2 vector. */
  for(i = 0; i < N; i++)
    src2[i] = src1[i];

  const int nRepetitions = 15000;
  printf("Call function copy_vect() %d times...\n", nRepetitions);

  for(i = 0; i < nRepetitions; i++)
    copy_vect(dst, src2, N);

  /* Verify result correctness by checking that dst now contains the
     same elements as src. */
  for(i = 0; i < N; i++) {
    if(dst[i] != src1[i]) {
      printf("ERROR: (dst[i] != src1[i]) for i = %d\n", i);
      return -1;
    }
  }
  printf("OK, result seems correct.\n");

  return 0;
}
