program abc
  real :: a
  call random_number(a)
  print *, a
  select case(a > 0.5)
  case(.true.)
     print *, 'it is true'
  case(.false.)
     print *, 'it is false'
  end select
  
end program
