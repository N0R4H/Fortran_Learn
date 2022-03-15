
! FORTRAN (FORmula TRANsistor) created in 1954

program fortranlean
	IMPLICIT NONE	!When enabled, variable types must be explicitly mentioned

	!kind parameter specifies the precision of a variable type
	! SELECTED_REAL_KIND(a,b)) =>  (a^-b <---> a^b)

	REAL(KIND = SELECTED_REAL_KIND(10,34))::area, radius	
	REAL, PARAMETER :: PI = 3.141592656869
	REAL, dimension(3:7) ::b		! array consisting of indices from 3 to 7
	REAL, dimension(20)  ::f			! array of 20 storage slots

	!G77 AND NAG COMPILERS              MOST COMMON COMPILERS
	!KIND 	BYTES                         KIND         BYTES
	!2^0  1    2^0	  1                     1            2^(1-1) =  1 
	!2^1  2    2^1    2                     2            2^(2-1) =  2
	!2^2  4    2^2    4                     3            2^(3-1) =  4
	!2^3  5    2^3    8                     4            2^(4-1) =  8
	!2^4 16    2^4 = 16                     5            2^(5-1) = 16
	!
	! Hence INTEGER(KIND = 4) could be 4 or 8 bytes depending on the compiler
	! However INTEGER*4 WILL ALWAYS BE 4BYTES

	INTEGER*4 ::a = 2
	INTEGER ::g = 1
	INTEGER ::k 
	b = (/1,2,3,4,5/)
	f = (/ (g, g = 1, 40,2) /)		!kind of like a list comprehension, of 20 storage.
	

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
	Do a = a,10,-1
		IF (a == 15) THEN
			print *, a, 'Broke'		! exits or breaks 
			EXIT 
		END IF
	END DO

	do a = a,30,1
		if (a == 25) Then
			cycle					! cycles back or continues
		end if
		print *, a
	end do
	a = a+1+&			!& is not and bitwise!! but a continuation character for next line
	23

	!logical operators -> .{OPERATOR}. syntax
	! for eg:- .and., 

	! READ *, k    -> INPUT
	! WRITE (*,*) k -> OUTPUT (NOTE the variable implicit type must be mentioned.


	!FORTRAN INTRINSIC FUNCTIONS
	!SQRT(X), SIN(X), COS(X), TAN(X)



end program fortranlean