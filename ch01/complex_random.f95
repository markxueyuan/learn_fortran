! designed to be imported by optional_argument.f95
module complexRandom
    implicit none
    contains
    subroutine complexRandomPairs(z, nPairs)
        complex, intent(out) :: z(:)
        integer, optional, intent(in) :: nPairs
        real :: x(size(z)), y(size(z))
        integer :: m

        if(present(nPairs)) m = min(size(z), nPairs)

        call random_number(x(1:m))
        call random_number(y(1:m))

        z(1:m) = cmplx(x(1:m), y(1:m))
    end subroutine
end module
