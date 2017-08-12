program abc
  use set_precision, only: wp
  use sparseTypes, only: dpTriplet, dpTripletList
  USE sparseAssign, only : assignment (=)

  type(dpTriplet) :: a, b, c, d, x
  type(dpTripletList) :: LIST

  a = dpTriplet(2, 1, 5.0E0_wp)
  b = dpTriplet(5, 1, 2.0E0_wp)
  c = dpTriplet(1, 2, -1.0E0_wp)
  d = dpTriplet(6, 2, -3.0E0_wp)

  List = a  
  List = [a, b, c, d]
  print *, List%rows, List%values

  
end program abc
