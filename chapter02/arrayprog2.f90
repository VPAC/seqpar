program arrayProg

integer, dimension(4,4) :: melancolia
melancolia = transpose(reshape((/16, 5, 9, 4, 3, 10, 6, 15, 2, 11, 7, 14, 13, 8, 12, 1 /), shape(melancolia)))

print '(1x, 4I5/)', melancolia
   
end program arrayProg
