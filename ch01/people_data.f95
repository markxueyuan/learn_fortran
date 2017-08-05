! This module is designed to be used by module_basic.f95
module peopleData
    implicit none

    type personal
        character(len=32) :: name
        integer :: age
        real, private :: salary = 100.0
        ! declare as private so that outside program
        ! cannot directly access it
        character :: sex
    end type

    contains

    subroutine salaryAccess(key, person, wage)
        integer, intent(in) :: key ! not allowed to be modified
        type(personal), intent(inout) :: person ! can be modified
        real, intent(inout) :: wage
        associate(pay => person%salary)
            if(key == 1) wage = pay ! get
            if(key == 2) pay = wage ! set
        end associate
        return ! and f77 style
    end subroutine
    ! subroutine has a blur difference between input and output variables
end module
