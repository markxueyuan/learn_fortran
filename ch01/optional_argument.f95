! co-compile this file with complex_random.f95
program getComplexPairs
    use complexRandom, only: complexRandomPairs
    complex :: z(5)
    real :: x(2000)
    complex :: y(1000)


    ! get complex numbers for all slots of array
    call complexRandomPairs(z)
    print *, z

    call complexRandomPairs(z, 2)
    print *, z
    call complexRandomPairs(z, nPairs=2)
    print *, z

    ! array slice
    call complexRandomPairs(z(1:2))
    print *, z

    ! Instead, you can use transfer to turn an 2n real array
    ! into n complex array

    call random_number(x)
    y = transfer(source=x, mold=y) ! memorize these 2 subroutine/function
    print *, y
end program
