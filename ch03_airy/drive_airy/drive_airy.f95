program abc
  use airy, only: airy_ai
  use set_precision, only: wp, skind

  implicit none
  
  real(wp) :: xr, air, dair
  complex(wp) :: xc, aic, daic
  complex(skind) :: xc1, aic1, daic1
  integer :: ierr, ierc, ierc1
  ierc = 0

  call airy_ai(xr, air, dair, ierr)
  call airy_ai(xc, aic, daic, ierc)
  call airy_ai(xc1, aic1, daic1, ierc)
  xr = .5E0_wp
  xc = (.50_wp)
  xc1 = (.5E0_skind, .5E0_skind)
  print *, xr, air, dair
  print *, xc, aic, daic
  print *, xc1, aic1, daic1
  print *, ierr, ierc
end program abc
