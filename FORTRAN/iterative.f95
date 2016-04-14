! Name: Sameer Gulamali
! ID: 0808465
! Program Details: A fortran program that performs the Ackermann function iteratively using stacks

module stack
    integer :: top = 0
    integer, dimension(1000000) :: items = 0
end module

!check if stack is full
function isFull () result(r)
    use stack
    
    if (top == 1000000) then
        r = 1
    else
        r = 0
    end if  
end function isFull

!check if stack is empty
function isEmpty () result(r)
    use stack
    
    if (top == 0) then
        r = 1
    else
        r = 0
    end if  
end function isEmpty
    
!returns top of the stack
function getTop () result(r)
    use stack
    integer :: r
    r = items(top)
end function getTop 

!pushes an item into the list
subroutine push (m)
    use stack
    integer :: r
    integer, intent(in) :: m
    
    if (isFull == 1) then
        stop 
    else 
        top = top + 1
        items(top) = m
    end if
end subroutine push

!pops an item from the stack
subroutine pop (m)
    use stack
    integer :: getTop
    integer, intent(out) :: m
    
    if (top == 0) then
        stop 
    else 
        m = getTop()
        top = top - 1
    end if
end subroutine pop

!ackermann function that uses the stack
function ackermann (temp_m,temp_n) result (n)
    use stack
    integer, intent(in) :: temp_m, temp_n
    integer :: m, n
    
    m = temp_m
    n = temp_n
    
    call push(m)
    do while (top /= 0)
        call pop(m)
        if (m == 0) then
            n = n + 1
        else if (n == 0) then
            n = 1
            call push(m-1)
        else 
            n = n - 1
            call push(m-1)
            call push(m)
        end if
    end do
end function ackermann



program iterative
    
    integer :: r, m, n, ackermann
    integer(kind=8) start,finish,rate
    call system_clock(count_rate=rate)
    
    write (*,*) 'Enter m and n: '
    read (*,*) m, n
    
    call system_clock(start)
    r = ackermann(m,n)
    call system_clock(finish)
    write(*,*) 'Result = ', r
    write(6,*) 'Elapsed time in seconds:',float(finish-start)/rate
    
end
    
