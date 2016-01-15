#include <stdio.h> 
#include <string.h>
int main(void) 
{ 
   char salutation[] = "Hello "; 
   char place[] = "World!"; 
   strcat( salutation, place);
   printf("%s\n", salutation);
   printf("%.14s\n", &salutation[6]); 
   return 0;
}
