program abc
  use ai_and_bi, only: abi
  use set_precision, only: skind, dkind

  real(skind) :: y1(4), x1
  real(dkind) :: y2(4), x2
  complex(skind) :: y3(4), x3
  complex(dkind) :: y4(4), x4
  integer :: f(2)
  integer :: g(3)

  x1 = 1.1_skind
  x2 = 1.1_dkind
  x3 = (.8_skind, .9_skind)
  x4 = (.8_dkind, .9_dkind)

  y1 = abi(x1, f)
  y2 = abi(x2, f)
  y3  = abi(x3, g)
  y4 = abi(x4, g)

  print *, y3, y4
end program abc
