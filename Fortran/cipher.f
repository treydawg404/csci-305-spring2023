        program MyEx
        implicit none
        integer :: var
        write (*,*) 'Give number (6 digits)'
        read (*,*) var
        write (*,*) 'Use '
        call get1st(var)
        call get2nd(var)
        call get4th(var)
        call get6th(var)
        end program MyEx

        subroutine get1st(temp)
        implicit none
        integer, intent(in) :: temp
        write (*,'(1x,i0)',advance='no') mod((temp / (10 ** 0)), 10)
        end subroutine get1st

        subroutine get2nd(temp)
        implicit none
        integer, intent(in) :: temp
        write (*,'(1x,i0)',advance='no') mod((temp / (10 ** 1)), 10)
        end subroutine get2nd

        subroutine get4th(temp)
        implicit none
        integer, intent(in) :: temp
        write (*,'(1x,i0)',advance='no') mod((temp / (10 ** 3)), 10)
        end subroutine get4th

        subroutine get6th(temp)
        implicit none
        integer, intent(in) :: temp
        write (*,'(1x,i0)',advance='yes') mod((temp / (10 ** 5)), 10)
        end subroutine get6th
