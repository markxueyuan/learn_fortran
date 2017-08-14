module sparseOperator
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
  
end module sparse_operator
