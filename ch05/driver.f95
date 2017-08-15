program abc
  use classDate
  type(date) :: today
  type(datetime) :: now
  type(date) :: d2
  logical :: ok

  
  call today%printDate

  
  
  !call now%printTime
  !  call now%printDate
  ok = today%setdate(3,3,2009)

  ok = now%setdate(4,4,2010)
  now%hour = 1
  now%minute = 2
  now%second = 41
  call today%printDate()
  call now%printTime()



  
  
  
end program abc
