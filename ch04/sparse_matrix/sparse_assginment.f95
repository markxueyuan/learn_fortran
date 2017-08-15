module sparseAssign
  use sparseTypes, only: dpTriplet, dpTripletList, getExpansionFactor &
       dpHBSparseMatrix
  use set_precision, only: wp
  
  interface assignment (=)
! type(dpTripletList) = type(dpTriplet)
     module procedure a_triplet
! type(dpTripletList) = type(dpTriplet)(:)     
     module procedure list_of_triplets
! type(dpTripletList) = integer(0)
     module procedure clear_triplets
! type(dpTriplet(:)) = type(dpHBSparseMatrix)
     module procedure list_of_triplets_eq_hb_matrix
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
! -------------------------------

  subroutine list_of_triplets_eq_hb_matrix(triplets, hb_matrix)
    implicit none
    type(dpTriplet) , intent(inout), allocatable :: triplets(:)
    type(dpHBSparseMatrix), intent(in) :: hb_matrix    
    integer :: i, icount, istat, j, k, l, m, n
    n = hb_matrix%noOfColumns
    k = max(0, hb_matrix%colStart(n + 1) - 1)
! allocate enough space k for the values
    allocate(triplets(k), stat=istat)

    if(istat /= 0) then
       write(*, *) 'Allocation failure in assignment triplets(:) = hb_matrix'
       return
    end if

    l = 0
    icount = 0
    
    do j = 1, n
!get the number of entries in column j
       m = hb_matrix%colStart(j + 1) - hb_matrix%colStart(j)
       do i = 1, m
          l = l + 1
          icount = icount + 1
          triplets(l) = dpTriplet(hb_matrix%rowIndices(icount), j, hb_matrix%values(icount))
       end do
    end do    
       
  end subroutine list_of_triplets_eq_hb_matrix

  subroutine hb_matrix_eq_triplex_list(hb_matrix, triplet_list)
    use sparseSort, only: sparseData
    use sortElements, only: qsort

    implicit none
    type(dpHBSparseMatrix), intent(inout) :: hb_matrix
    type(dpTripletList), intent(in), target :: triplet_list
    type(sparseData) :: spData

    "not finished yet"
  end subroutine hb_matrix_eq_triplex_list
  
  

end module
