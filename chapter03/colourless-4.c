#include <stdio.h>
#include <stdlib.h>
#include "omp.h"

int main (void)
{
    printf("Noam Chomsky said ");
  #pragma parallel
  {  
     #pragma omp sections nowait
     {
     #pragma omp section
     printf("Colourless "); 
     #pragma omp section
     printf("green ");      
     #pragma omp section
     printf("ideas ");   
     #pragma omp section
     printf("sleep furiously ");
     }
   }
 printf("\n");
 return(0);
}	
