program array_multi
  real :: m1(3,3), m2(3,3), mm(3,3)
  m1 = transpose(reshape((/1, 2, 3, 4, 5, 6, 7, 8, 9/), shape(m1)))
  m2 = m1
  mm = m1*m2
  print *, mm
  print *, (/1, 2, 3/)
  print *, [1, 2, 3]
  
end program array_multi
