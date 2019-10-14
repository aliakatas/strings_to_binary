!  str_to_binary.f90 
!
!  FUNCTIONS:
!  convert_string_to_binary - Take a string and convert it to binary format (utf8).
!

!****************************************************************************
!
!  PROGRAM: main
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

   program main
   
   implicit none
   
   ! Variables
   integer, parameter   :: MAXSTRLEN = 250
   integer              :: ij
   character(MAXSTRLEN) :: string
   
   ! Body
   ij = 1
   do 
      call GET_COMMAND_ARGUMENT(ij, string)
      if (len_trim(string) == 0) exit
      
      if (len_trim(string) == MAXSTRLEN) then
         write(*,'(a, i0, a)') '  Note: The string in pos: ', ij, ' is occupying the full length of the internal variable.'
         write(*,'(a)') '  The result might be inaccurate...!'
      end if
      
      call convert_string_to_binary(string)
      ij = ij + 1
   end do
   
   write(*,*) ' '
   write(*,*) ' -----  End of message  ----- '
   read(*,*)   
   
   ! Procedures
   contains 
   
   subroutine convert_string_to_binary(str)
   character(*), intent(in)               :: str
   
   integer                 :: n, ascID, ic
   integer                 :: stat
   
   n = len_trim(str)
   
   do ic = 1, n
      ascID = iachar(str(ic:ic))
      write(*,'(a, b8.8)') '   ', ascID
   end do
   write(*,*) ' '
   
   end subroutine convert_string_to_binary

   end program main

