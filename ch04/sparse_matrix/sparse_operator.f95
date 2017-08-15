module sparseOperator
  use sparseTypes, only: dpTriplet, dpTripletList, dpHBSparseMatrix
  use sparseAssign, only: assignment(=)
  
  interface operator (.t.)
     module procedure transpose_sparse
  end interface operator (.t.)

  interface operator (+)
     module procedure sum_sparse
  end interface operator (+)
  
  interface operator (.p.)
     module procedure sparse_matrix_times_vector, &
          vector_times_sparse_matrix, sparse_matrix_times_matrix, &
          matrix_times_sparse_matrix
  end interface operator (.p.)

contains

  function transpose_sparse(b) result(a)
    implicit none

    type(dpHBSparseMatrix), intent(in) :: b
    type(dpHBSparseMatrix), intent(out) :: a
    type(dpTriplet), allocatable :: bb(:)
    type(dpTripletList) :: aa
    integer :: itemp, k

    bb = b

    do k = 1, size(bb)
       itemp = bb(k)%rowIndex
       bb(k)%rowIndex = bb(k)%columnIndex
       bb(k)%columnIndex = itemp
    end do

    aa = bb
    
  end function transpose_sparse
  
end module sparse_operator
