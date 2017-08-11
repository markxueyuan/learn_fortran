module BlasInterface
  implicit none

  interface

     subroutine dgemv(trans, m, n, alpha, a, lda, x, incx, beta, y, incy)
       character*1 trans
       integer m, n, lda, incx, incy
       double precision alpha, beta
       double precision a(lda,*), x(*), y(*)  
     end subroutine dgemv

     double precision function dnrm2(n, x, incx)
       integer n, incx
       double precision x(*)
     end function dnrm2

  end interface
     
end module BlasInterface

