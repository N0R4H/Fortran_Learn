
program fortranlean

	REAL::area, radius
	REAL, PARAMETER :: PI = 3.141592656869

	radius = 43.12
	!READ (5, *) radius
	area = pi *radius*radius
	!WRITE (6, *) area
	print *, "Area is ", area

end program fortranlean