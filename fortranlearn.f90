
program fortranlean

	REAL ::area, radius
	REAL, PARAMETER :: PI = 3.141592656869
	INTEGER ::a = 2

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
	
	! DO loop tantamount to for loop
	DO a = 1,10,2
		print *, a
	END DO
	! now a is set to last number

	! DO while 
	DO WHILE (a<30)
		a = a+1
		print *, a
	END DO 
end program fortranlean