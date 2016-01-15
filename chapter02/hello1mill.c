#include <stdio.h> 
int main(void) 
{ 
   char greetings[] = "Hello world!"; 
   int a;
   for ( a = 0; a < 1000000; a = a + 1 )
   	{
	printf("%s\n", greetings); 
   	}
return 0;
}
