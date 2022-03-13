
program fortranlean

	REAL ::area, radius
	REAL, PARAMETER :: PI = 3.141592656869
	INTEGER ::a = 2

	radius = 43.12
	!READ (5, *) radius
	area = pi *radius*radius
	!WRITE (6, *) area
	print *, "Area is ", area

	!IF-THEN; ELSE IF-THEN; ELSE; END IF conditional statement
	IF (area > 6000)THEN
		print *, "bIG"
	ElSE IF (area < 6000 .and. area>1000) THEN 
		print *, "Small"
	ELSE
		print *, "Too small"
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
	! now a is set to last number

	!break/EXIT loop
	DO a = a,10,-1
		IF (a == 15) THEN
			print *, a, 'Broke'
			EXIT 
		END IF
	END DO


	!logical operators -> .{OPERATOR}. syntax
	
end program fortranlean