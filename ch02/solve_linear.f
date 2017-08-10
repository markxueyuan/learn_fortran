* This code solves linear equation system
* Using lapack routines
      program solveLinear
        double precision :: one, zero
        parameter (one = 1.0d0)
        parameter (zero = 0.0d0)
        integer, parameter :: maxdim = 10000
* a is the coefficient matrix
* y is the solution vector
        double precision :: a(maxdim, maxdim),
     $                      b(maxdim, 1),
     $                      y(maxdim)
        integer ipvt(maxdim)
* n is user-defined system size,
* info is error flag
* i, j are loop control variables
        integer n, info, i, j

* declare the return type of the function dnrm2
        double precision :: relerr, dnrm2

        real tstart, tend

10      continue
        write(*,'(A)') 'Input the system dimension: '
        read(*, '(I5)', iostat = info) n
        if(n .le. 0 .or. info .ne. 0) GO TO 50

        do 30 j = 1, n
            do 20 i = 1, n
                call random_number(a(i,j))
20          continue
            call random_number(y(j))
            b(j,1) = zero
30      continue

        call dgemv('N', n, n, one, a, maxdim, y, 1, zero, b, 1)

        call cpu_time(tstart)
        call dgetrf(n,n,a,maxdim,ipvt,info)

        if(info .lt. 0) then
            write(*, '(''Argument ", i3, " has an illegal value'')')
     $           -info

        else if(info .gt. 0) then
            write(*, '(''Zero diagonal value detected in the upper ''//
     $                 ''triangular factor at position '', i7)') info
* dgetrs solves a system of linear equations
* A * X = B or A**T * X = B
* with a general N-by-N matrix A using the LU factorization computed by dgetrf
        else
            call dgetrs('n', n, 1, a, maxdim, ipvt, b, maxdim, info)
            if (info .lt. 0) then
                write(*, '(''Argument '', i3, '' has an illegal val'')')
     $               -info
            endif

        call cpu_time(tend)

        do 40 i=1, n
            b(i,1) = b(i,1) - y(i)
40      continue

        relerr = dnrm2(n, b, 1) / dnrm2(n, y, 1)
* P https://docs.oracle.com/cd/E19957-01/805-4939/z4000743a6e2/index.html
        write(*, '(A, 1PD12.6)') 'The relative error Y - '//
     $  'inverse(A)*(AY) =', relerr
        write(*, '(A, I5, A, 0PE12.4)') 'The compute time (s) for '//
     $  'solving a system of size ', n, " = ", tend - tstart

        end if


50      stop


      end program

