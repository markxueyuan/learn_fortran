program abc


    ! 2.3.1
    ! For demonstrate kind inquiry, kind specification etc.

    ! kind specification
    real(kind=4) :: x = 1.0
    real(8) :: y = 1.0
    real(kind=kind(0.0d0)) :: z = 1.0! use this for portability reasons
    integer, parameter :: wp = kind(0.0d0)
    real(wp) :: u = 1.0
    integer :: p
    ! using intrinsic function selected_real_kind(p, r)
    ! return at least decimal precision p and exponent range [-r, r]
    ! return -1 if the requested precision not available
    ! return -2 if the requested range not available
    ! return -3 if both are unavailable
    ! if multiple available, the least returned.
    integer, parameter :: cp = selected_real_kind(18, 3)
    real(cp) :: v = 1.0

    print *, "The parameter for the default real: ", kind(0.0)
    print *, "The parameter for the mandatory extended precision: ", kind(0.0d0)

    print *, x, y, z, u
    write(*,*) cp, v

    do p = 1,50
        print *, p, selected_real_kind(p,1)
    end do
    ! so the decimal precisions for gfortran are 6, 15, 18, 33
    ! Their numbers                          are 4,  8, 10, 16
end program
