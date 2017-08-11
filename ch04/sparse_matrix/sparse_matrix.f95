program abc
  use set_precision only: wp

  type dpTriplet
     integer :: rowIndex, columnIndex
     real(wp) :: value
  end type dpTriplet
  
  type dpTripletList
     real(wp), private :: expansionFactor = defaultExpansionF
     integer :: lastTriplet = 0
     integer :: errFlag = 0
     integer, allocatable :: rows(:), columns(:)
     real(wp), allocatable :: values(:)     
  end type dpTripletList

  
end program
