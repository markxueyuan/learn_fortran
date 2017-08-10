program solveLinear
  use set_precision, only: wp
  use LapackInterface, only: dgetrf, dgetrs
  use BlasInterface, only: dgemv, dnrm2

  real(wp), allocatable :: a(:,:), b(:,:), y(:)
  integer, allocatable :: ipvt(:)

  integer :: n, info, i, j
  real(wp) :: relerr ! with interface , dnrm2 causes conflict
  real :: tstart, tend
  real(wp), parameter :: one = 1.0E0_wp, zero = 0.0E0_wp

  do while(.true.)
     write(*, advance="no", fmt='(''Input the system dimension: '')')
     read(*, '(i5)', iostat=info) n

     if(n <= 0) then
        write(*, '(a)') 'Please type a positive integer'
        stop
     end if

     if(info /= 0) then
        write(*, '(''Illegal value given for argument '', i3)') info
        stop
     end if

     allocate(a(n,n), b(n,1), y(n), ipvt(n), stat=info)

     if(info /= 0) then
        write(*, '(''Error attempting to allocate array space''// &
             ''for system of order '', i6)') n
        stop
     end if

     do j = 1, n
        do i = 1, n
           call random_number(a(i,j))
        end do
        call random_number(y(j))
        b(j, 1) = zero
     end do

     ! compute b = a*y
     call dgemv('N', n, n, one, a, n, y, 1, zero, b, 1)

     call cpu_time(tstart)
     ! computer pivot vector
     call dgetrf(n, n, a, n, ipvt, info)

     if (info < 0) then
        write(*, '(''Argument '', i3, '' has an illegal value'')') &
             -info
     else if (info > 0) then
        write(*, '(''Zero diagonal value detected in upper''// &
        ''traiangular factor at position '', i7)') &
        info
     else
        ! solve the linear system
        call dgetrs('N', n, 1, a, n, ipvt, b, n, info)

        if(info < 0) then
           write(*, '(''Argument '', i3, '' has an illegal value'')') &
                -info
           stop
        end if

        call cpu_time(tend)

        do i = 1, n
           b(i,1) = b(i,1) - y(i)
        end do

        relerr = dnrm2(n, b, 1) / dnrm2(n, y, 1)

        write(*, '(A, 1PE12.6)') 'The relative error Y - '//&
             'inverse(a)*(a*y) = ', relerr
        write(*, '(A, I5, A, 0PE12.4)') 'The compute time for '//&
                 'solving a system of size', n, ' = ', tend - tstart 
     end if

     deallocate(a, b, y, ipvt, stat=info)

     if(info /= 0) then
        write(*, '(A)') 'Deallocate Failed'
        stop
     end if
     
  end do
end program
