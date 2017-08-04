program try_do
    outer: do i = 1, 9
        inner: do j = 1, 9
            print *, 'before: ', i, j
            if(j .gt. 3) cycle outer  ! cycle to outer
            print *, 'before: ', i, j ! exit out of outer
            if (i .gt. 6) exit outer
            print *, 'after: ', i, j
        end do inner
    end do outer
end program
