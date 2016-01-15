program hello3
	implicit none 
	character(len=12) :: greetings 
	integer :: c
	greetings = "Hello World!" 
	c = 99

! Prints 'Hello World' once
   do while (c < 11)       
	print *, greetings   
   end do 

end program hello3

