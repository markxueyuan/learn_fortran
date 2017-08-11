program abc
  use set_precision, only: skind, dkind
  real(skind) :: a
  real(dkind) :: b
  complex(skind) :: c
  integer :: i

  b = 1.0/10.0
  write(*,*) 'b=', b
  a = 1.0/10.0
  write(*,*) 'a=', a
  a = abs(a - b)
  write(*,*) 'a=', a
  a = 1.0/10.0D0
  write(*,*) 'a=', a
  a = abs(a-b)
  write(*,*) 'a=', a
  a = 2/5*a
  write(*,*) "a=", a
  c = 2
  write(*,*) "c=", c
  i = -5.9D0
  write(*,*) "i=", i
  
  
end program
