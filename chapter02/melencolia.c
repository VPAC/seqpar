#include <stdio.h>
 
int main () {

int melancolia [4][4] = {  
   {16, 3, 2, 13} ,   
   {5, 10, 11, 8} ,  
   {9, 6, 7, 12} ,  
   {4, 15, 14, 1} ,  
};

int row, column;
 
   /* output each array element's value */
   for ( row = 0; row < 4; row++ ) {
      for ( column = 0; column < 4; column++ ) {
         printf("melancolia[%d][%d] = %d\n", row,column, melancolia[row][column] );
      }
   }
   
   return 0;
}
