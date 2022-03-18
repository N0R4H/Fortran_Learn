
! FORTRAN (FORmula TRANsistor) created in 1954

SUBROUTINE abc(input, output)
		REAL, INTENT(IN) :: input
		REAL, INTENT(OUT):: output

		output = output**2 + output*input
	end subroutine

INTEGER FUNCTION func(a,g) result(k)
		INTEGER, intent(inout) ::a,g
		k = a*g + a+g**a
END FUNCTION

program fortranlean
	IMPLICIT NONE	!When enabled, variable types must be explicitly mentioned

	!kind parameter specifies the precision of a variable type
	! SELECTED_REAL_KIND(a,b)) =>  (a^-b <---> a^b)
	!ALL DECLARATIONS NEED TO PRECEDEDE ALL THE EXECTUABLE STATEMENTS
	REAL(KIND = SELECTED_REAL_KIND(10,34))::area, radius	
	REAL, PARAMETER :: PI = 3.141592656869
	REAL, dimension(3:7) ::b		! array consisting of indices from 3 to 7
	REAL, dimension(20)  ::f		! array of 20 storage slots
	INTEGER, ALLOCATABLE, dimension(:) ::l !allocatable type allows dynamic sizing 
	INTEGER , dimension(3,3)::M
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
	INTEGER ::i
	INTEGER ::j
	REAL :: output=3,input=5 
	INTEGER :: func
	external abc

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

	!arrays

	!RANKS -> NUMBER OF DIMENSIONS eg:= np.ndim([[1,2], [3,4]]) => 2
	!SHAPE -> GIVES AN array of the extend of all dimensions of the array
	!SIZE -> GIVES TOTAL NUMBER OF ELEMENTS 
	
	b = (/1,2,3,4,5/)
	f = (/ (g, g = 1, 40,2) /)		!kind of like a list comprehension, of 20 storage.
	f = f+ 14                       !ADD 14 TO ALL ARRAY ELEMENTS LIKE BROADCASTING
	
	l = (/(g, g = 1, 3, 1)/)
	l = (/(l, g=1,3,1)/)		    ! l gets extended 3 times
	print *,l

	do i = 1,3
		do j = 1,3
			M(i, j) = 1
		end do
	end do

	do i = 1,3		
			print *, M(i,:)	!printing matrix
	end do
	print *, size(M)	! total number of elements in matrix
	print *, shape(M)	!=> (/3, 3/)  3x3 matrix
	print *, rank(M)	!=> 2; matrix is 2D
	print *, rank(l)	!=> 1; array is 1D

	!SUBROUTINES and FUNCTIONS
	!need to explicitly mention external type for subroutines, for external procedure
	!SUBROUTINE  NAME(*PARAMETERS)
		!DATATYPE intent(in) :: input	!if intent is 'in', the input is CONSTANT
		!DATATYPE intent(out) :: output		!if intent is 'out' the output can be MODIFIED
		!DATATYPE intent(inout):: io  !if intent is 'inout', BOTH ARE MODIFIABLE

	!END SUBROUTINE


	print *, "Input and output are",input,output
	call abc(input, output)
	print *,"After calling subroutine, input and output are",input,output

	!FUNCTIONS
	!need to explicitly (implicit none) state datatype of function before
	!Different ways to express a function
	!
	!!Explicitly mentioning the result variable and result type:
	!function name(i) result(j)
	!	datatype intent(in) :: i !immutable 
	!	datatype name:: j
	!   j = {operation involving i}
	!end function

	!!Explicitly mentioning function type and result type
	!datatype function name(i) result(j)
	!	datatype intent(in) :: i !immutable 
	!   j = {operation involving i}
	!end function

	!!Explicitly mentioning function variable and function type 
	!datatype function name(i)
	!	datatype intent(in) :: i !immutable 
	!   name = {operation involving i}
	!end function

	!!Explicitly mentioning function result and function variable 
	!function name(i)
	!	datatype intent(in) :: i !immutable 
	!	datatype 			:: name
	!   name = {operation involving i}
	!end function

	!preferable 2
	print *, func(a,g)


end program fortranlean