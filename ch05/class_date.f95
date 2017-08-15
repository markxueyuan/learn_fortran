module classDate

  type date
     private
     integer :: day = 1
     integer :: month = 1
     integer :: year = 1990
     
   contains
     procedure, public :: printDate
     procedure, public :: setdate
     procedure, public :: getdate
  end type date

  type, extends(date) :: datetime
     integer :: hour, minute, second
   contains
     procedure :: printTime
  end type datetime
  

contains
  
  subroutine printDate(objDate)
    class(date), intent(in) :: objDate
    write(*, '(''Date: '', i2.2, ''/'', i2.2, ''/'', i4)') &
         objDate%day, objDate%month, objDate%year
    write(*, '(A)') 'Carpe diem'
    
  end subroutine printDate

  subroutine printTime(dtime)
    class(datetime), intent(in) :: dtime

    write(*, '(''Datetime: '', i2.2, ''/'', i2.2, ''/'', i4,' // &
         '''-'', i2, '':'', i2, '':'', i2)') &
         dtime%day, dtime%month, dtime%year, dtime%hour, &
         dtime%minute, dtime%second
  end subroutine printTime
  
! --------------------------
! mutator
  
  function setdate(dateObj, day, month, year) result(ok)
    integer, intent(in) :: day, month, year
    class(date), intent(out) :: dateObj
    logical :: ok
    
    dateObj%day = day
    dateObj%month = month
    dateObj%year = year

    ok = .true.
    
  end function setdate

! --------------------------
! accessor
  
  subroutine getdate(self, day, month, year)
    integer, intent(out) :: day, month, year
    class(date), intent(in) :: self
    
    day = self%day
    month = self%month
    year = self%year
    
  end subroutine getdate
  
  

  
end module classDate





