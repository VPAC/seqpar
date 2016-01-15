#include <stdio.h>

main()
{
     int  Grade = 2;

     switch( Grade )
     {
        case 1 ...  2 : printf( "Excellent\n" );
                   break;
        case 3 : printf( "Good\n" );
                   break;
        case 4 : printf( "OK\n" );
                   break;
        case 5 : printf( "Mmmmm....\n" );
                   break;
        case 6 : printf( "You must do better than this\n" );
                   break;
        default  : printf( "What is your grade anyway?\n" );
                   break;
     }
}

