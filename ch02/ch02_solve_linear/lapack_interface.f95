module LapackInterface
  implicit none

  interface
     
     subroutine dgetrf(m, n, a, lda, ipiv, info)
       integer m, n, lda, info
       integer ipiv(*)
       double precision a(lda,*)
     end subroutine dgetrf

     subroutine dgetrs(trans, n, nrhs, a, lda, ipiv, b, ldb, info)
       character*1 trans
       integer n, nrhs, lda, ldb, info
       integer ipiv(*)
       double precision a(lda,*), b(ldb,*) 
     end subroutine dgetrs
     
     
  end interface
end module LapackInterface

