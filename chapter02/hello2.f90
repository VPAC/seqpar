program hello
	implicit none 
	character(len=12) :: greetings 
	integer :: a
	greetings = "Hello World!" 

	! Hello World, ten times
	do a = 1, 1000000
	print *, greetings   
	end do

end program hello

