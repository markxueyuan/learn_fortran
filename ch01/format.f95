! In free form, you comment like this.

program abc

! declaration
character(len=100) :: aSplitString ! You have to declare a string like this
logical :: ifTrue, ifTrue2, ifTrue3

!!!!!! 1.4

! In free form, you indicate line continuation by appending & at the end of line
    x = 3
    y = 2.0*x**2 -&
        66.0*x
    print *, y

! To avoid to many blanks in line continuation, use 2 & like this

aSplitString = 'There will be no space in the mid&
               &dle of a word split across a continuation'
    print *, aSplitString

!!!!!! 1.6

    ifTrue = 1 >= 2 ! f90 style
    ifTrue2 = 1 .ge. 2 ! f77 style
    ifTrue3 = 1 /= 2 ! equivalent to .ne. in f77
    print *, ifTrue, ifTrue2, ifTrue3


end program
