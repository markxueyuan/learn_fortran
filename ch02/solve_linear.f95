program solveLinear
    use set_precision, only: wp
    real(wp), allocatable :: a(:,:), b(:,:), y(:)
    integer, allocatable :: iptv(:)
    integer :: n, info, i, j
    real(wp) :: relerr, dnrm2
    real :: tstart, tend
! suffix _wp inform the compiler to use the required precision
! if not, 1.0/30 will still be single precision even if
! declared wp.
    real(wp), parameter :: one = 1.0E0_wp, zero = 0.0E0_wp

    do while(.true.)
! advance='no' allows the line not to advance after the
! prompting statement is given
        write (*, advance='no', &
               fmt='(''input the system dimension: '')')

        relerr = 1273.55E-8_wp
        print *, relerr
        stop
    end do
end program
