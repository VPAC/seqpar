#include <stdio.h>
#include "omp.h"

int main () {

   int i, j;

   #pragma omp parallel 
   #pragma omp for
   /* local variable definition */
   
   for(i = 2; i<10000; i++) {
   
      for(j = 2; j <= (i/j); j++) 
         if(!(i%j)) break; // if factor found, not prime
         if(j > (i/j)) 
	 	printf("%d is prime\n", i);
   }
 
   return 0;
}
