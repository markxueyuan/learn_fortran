module sparseAssign
  use sparseTypes, only: dpTriplet, dpTripletList, getExpansionFactor
  use set_precision, only: wp
  
  interface assignment (=)
! type(dpTripletList) = type(dpTriplet)
     module procedure a_triplet
! type(dpTripletList) = type(dpTriplet)(:)     
     module procedure list_of_triplets
! type(dpTripletList) = integer(0)
     module procedure clear_triplets
  end interface assignment (=)

  contains
! -------------------
  
  subroutine clear_triplets(sparse, iflag)
    implicit none
    type(dpTripletList), intent(inout) :: sparse
    integer, intent(in) :: iflag

    if(iflag == 0) then
       if(allocated(sparse%values)) &
            deallocate(sparse%rows, sparse%columns, sparse%values)
       sparse%lastTriplet = 0
       sparse%errFlag = 0
    end if
  end subroutine clear_triplets
! --------------------------
  
  subroutine list_of_triplets(sparse, triplets)
    implicit none

    type(dpTripletList), intent(inout) :: sparse
    type(dpTriplet), intent(in) :: triplets(:)
    
    integer, allocatable :: tempInt(:)
    real(wp), allocatable :: tempReal(:)
    
    integer :: istat, j, k, last, m

    real(wp) :: expFactor
    expFactor = getExpansionFactor(sparse)

    istat = 0

    block: do
       k = size(triplets)
       last = sparse%lastTriplet
       if(k <= 0) exit block
       
       if(.not. allocated(sparse%values)) then
          m = int(k*expFactor)
          allocate(sparse%rows(m), sparse%columns(m), sparse%values(m), stat=istat)
          if(istat /= 0) exit block
          last = 0
          sparse%lastTriplet = k
          sparse%rows(1:K) = triplets(1:k)%rowIndex
          sparse%columns(1:k) = triplets(1:k)%columnIndex
          sparse%values(1:k) = triplets(1:k)%value
          exit block

       else
          j = size(sparse%values)
          
          if(k + last > j) then
             m = max(k + last, int(j*expFactor))
             
! Expand rows
             allocate(tempInt(m), stat=istat)
             if(istat /= 0) exit block             
             tempInt(1:last) = sparse%rows(1:last)
! move_alloc move allocation and data from one object to another
! Therefore the array is extended to longer
             call move_alloc(from=tempInt, to=sparse%rows)

! Expand columns             
             allocate(tempInt(m), stat=istat)
             if(istat/=0) exit block
             tempInt(1:last) = sparse%columns(1:last)
             call move_alloc(from=tempInt, to=sparse%columns)

! Expand values
             allocate(tempReal(m), stat=istat)
             if(istat /= 0) exit block
             tempReal(1:last) = sparse%values(1:last)
             call move_alloc(from=tempReal, to=sparse%values)
          end if
       end if

       sparse%lastTriplet = last + k
       sparse%rows(last + 1 : last + k) = triplets(1:k)%rowIndex
       sparse%columns(last + 1 : last + k) = triplets(1:k)%columnIndex
       sparse%values(last + 1 : last + k) = triplets(1:k)%value
       exit block             
    end do block
    
  end subroutine list_of_triplets
! ------------------------
  
  subroutine a_triplet(sparse, triplet)
    implicit none

    type(dpTripletList), intent(inout) :: sparse
    type(dpTriplet), intent(in) :: triplet

    call list_of_triplets(sparse, (/triplet/))
  end subroutine a_triplet

end module
