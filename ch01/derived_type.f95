program abc
    !!!!!! 1.7
    ! Derived types group logically connected data together
    ! It is user-defined record or structure introduced in f90
    ! A record of a member of an organization which consists of 4 fields:
    ! surname, age, salary and sex

    type personal
        character(len=32) :: surname
        integer :: age
        real :: salary
        character :: sex
    end type

    ! derived types can also contain other derived types

    type branch_office
        type(personal) :: people(2) ! with 2 people
        character(len=64) :: location
    end type

    type(personal) :: ppl(2) ! declare a variable with the type
    type(branch_office) :: offc


    ppl(1) = personal('Xue', 100, 1000000, 'male') ! Assignment statement
    ppl(2) = personal('He', 99, 2000000, 'f')
    offc = branch_office(ppl, 'Marion Pugh Drive')

    print *, ppl(1), ppl(2)%sex ! % is the component selector
    print *, offc

    ! associate names may be used instead of expressions or variables

    associate(arithmetic => 1+1,&
                     loc => offc%location,&
                    name => offc%people(2)%surname)
    print *, arithmetic, loc, name
    end associate

    !trim
    print *, len(trim(" ab ")) ! trim in Fortran only removes trailing blanks!!!








end program
