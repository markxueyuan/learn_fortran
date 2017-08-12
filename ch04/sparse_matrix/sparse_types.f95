module sparseTypes
  
  use set_precision, only: wp

  implicit none

  real(wp), parameter, private :: defaultExpansionF = 1.2E0_wp
! -------------------------
  
  type dpTriplet
     integer :: rowIndex, columnIndex
     real(wp) :: value
  end type dpTriplet
! ------------------------
  
  type dpTripletList
     real(wp), private :: expansionFactor = defaultExpansionF
     integer :: lastTriplet = 0
     integer :: errFlag = 0
     integer, allocatable :: rows(:), columns(:)
     real(wp), allocatable :: values(:)     
  end type dpTripletList

  contains
! ------------------------------

    subroutine setExpansionFactor(tList, newFactor)
      type(dpTripletList), intent(inout) :: tList
      real(wp), intent(in) :: newFactor
      real(wp), parameter :: one = 1.0E0_wp

      if(newFactor > one) then
         tList%expansionFactor = newFactor
      end if
    end subroutine setExpansionFactor
! ----------------------------------
    
    function getExpansionFactor(tList) result(factor)
      type(dpTripletList), intent(inout) :: tList
      real(wp) :: factor
      factor = tList%expansionFactor
    end function getExpansionFactor

end module sparseTypes


  

