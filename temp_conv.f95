program temp_conv
    implicit none
    integer :: n ! number of temperatures to convert
    real :: f, c ! temperature values in F and C
    integer :: i ! loop counter
    print *, 'Number of conversions= '
    read *, n
    do i = 1, n
        print *, 'Fahrenheit temp. no ', i, '='
        read *, f
        c = 5.0/9.0*(f - 32)
        print *, f, 'F is ', c, 'C'
    end do
end program
