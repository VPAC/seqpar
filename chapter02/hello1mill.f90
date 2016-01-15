program hello
	implicit none 
	character(len=16) :: greetings 
	integer :: a
	greetings = "Hello World!" 

	! Hello World, one million times
	do a = 1, 1000000
	print *, greetings   
	end do

end program hello

