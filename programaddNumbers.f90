!my first fortran program POG

program addNumbers

! This simple program adds two numbers
   implicit none

! Type declarations
   INTEGER(KIND = 2) :: a, b, result

! Executable statements
   a = 11.0
   b = 14.0
   result = a + b
   print *, "The total is ", result

end program addNumbers

