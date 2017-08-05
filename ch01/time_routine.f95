! learn to  use intrinsic subroutine cpu_time
program timeRoutine
    real :: timeStart, timeEnd, cpuTimeUsed
    integer :: istart, irate, iend
    real :: elapsed_time
    integer :: add = 0

    ! cpu_time measures the amount of time resource the
    ! program actually uses.
    call cpu_time(timeStart)
    call system_clock()
    do i=1,1000000000
        add = add + 1
    end do
    print *, add
    call cpu_time(timeEnd)
    cpuTimeUsed = timeEnd - timeStart
    print *, timeStart, timeEnd, cpuTimeUsed

    ! elapsed time is measured by system_clock.
    ! It assumes a processor-dependent unit.
    ! We have to convert it into standard time unit
    ! using the processor dependent rate.

    call system_clock(count=istart, count_rate=irate)
    do i=1,1000000000
        add = add + 1
    end do
    call system_clock(count=iend)
    elapsed_time = real(iend - istart) / real(irate)
    print *, istart, iend, elapsed_time
end program
