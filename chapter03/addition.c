/* 
Add all elements in an array in parallel. 
Original from: http://www.bowdoin.edu/~ltoma/teaching/cs3225-GIS/fall17/Code/OpenMP/example4.c
Modifications from Lev Lafayette
*/ 

#include <stdio.h> 

int main() {

  const int N=100; 
  int a[N]; 

  // Initialize 
  for (int i=0; i<N; i++)
    a[i] = i; 


  // Compute sum 
  int local_sum, sum; 

#pragma omp parallel private(local_sum) shared(sum) 
  { 
    local_sum =0; 
    
    // The array is distributed statically between threads
#pragma omp for schedule(static,1) 
    for (int i=0; i<N; i++) {
      local_sum += a[i]; 
    }

    //each thread calculated its local_sum. All threads have to add to
    //the global sum. This operation should use the atomic directive.
    // Check to see what happens if the wrong pragma is applied.

# pragma omp critical 
#pragma omp atomic
    sum += local_sum;
  } 


  printf("sum=%d should be %d\n", sum, N*(N-1)/2);
}

