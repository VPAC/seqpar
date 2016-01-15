program arrayProg

   integer :: matrix(4,4), i , j !two dimensional real array
   
   !assigning some values to the array matrix
   do i=1,4
      do j = 1, 4
         matrix(i, j) = i+j
      end do
   end do
   
   !display the values
   do i=1,4
      do j = 1, 4
         Print *, matrix(i,j)
      end do
   end do
   
end program arrayProg
