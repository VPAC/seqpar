#include <stdio.h> 
int main(void) 
{ 
   char greetings[] = "Hello world!"; 
   int a;
   #pragma omp parallel
   for ( a = 1; a < 11; a = a + 1 )
   	{
	printf("%s\n", greetings); 
   	}
return 0;
}
