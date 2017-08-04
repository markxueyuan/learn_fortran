C234567
C Fortran 77: fixed format source code.
C Only complete lines can be comments in Fortran 77.
C Use C or * at the start of line at your pleasure
C That said, the gfortran doesn't support *

      program abc


C Continuation Lines
C Blanks after the - are included
C Blanks before the + are not included
      x = 3
      y = 2.0*x**2 -
     +    66.0*x
      print *, y



      end program
