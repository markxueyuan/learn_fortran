! compile together with people_data.f95
program abc
    use peopleData, only: ppl => personal, salaryAccess
    ! import personal as ppl
    implicit none
    type(ppl) :: xy
    real :: salary
    real :: after

    xy = ppl('Yuan',100,sex = 'm')

    call salaryAccess(1, xy, salary)
    print *, salary

    salary = 604.00
    call salaryAccess(2, xy, salary)
    ! not like function, subroutine cannot be embedded in statement
    ! it can only be called.
    call salaryAccess(1, xy, after)
    print *, after

end program


