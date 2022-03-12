
program fortranlean

	REAL ::area, radius
	REAL, PARAMETER :: PI = 3.141592656869

	radius = 43.12
	!READ (5, *) radius
	area = pi *radius*radius
	!WRITE (6, *) area
	print *, "Area is ", area

	!If else conditional statement
	IF (area > 5)THEN
		print *, "bIG"
	ElSE
		print *, "Small"
	END IF

end program fortranlean