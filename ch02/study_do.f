      program abc
        integer :: istart, ilast, istep, isum
        integer :: jstart, jlast, jstep, jsum

        istart = 1
        ilast = 10
        istep = 2
        isum = 0


        jstart = 1
        jlast = 10
        jstep = 2
        jsum = 0

* This is the block do statement with label
        do 100 i = istart, ilast, istep
            isum = isum + i
            print *, i, '>>', isum
100     continue

        print *, '>>>>>>>'
        print *, isum
        print *, '------------------'

* This is the noblock do statement with label
        do 200 j = jstart, jlast, jstep
            jsum = jsum + j
200         print *, j, '>>', jsum

        print *, '>>>>>>>'
        print *, jsum
        print *, '------------------'

* In noblock statement,
* the labeled statement is an action statement
* which is the last statement executed before
* exiting the loop

      end program
