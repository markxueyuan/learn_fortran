program test_move_alloc
  integer, allocatable :: a(:), b(:)

  allocate(a(3))
  a = [1, 2, 3]
  call move_alloc(from=a,to=b)
  print *, allocated(a), allocated(b)
  print *, 'a is ', a
  print *, 'b is ', b
end program test_move_alloc

 
