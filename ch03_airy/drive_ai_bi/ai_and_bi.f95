module ai_and_bi
  implicit none

  interface abi
     module procedure sairy, dairy, cairy, zairy
  end interface abi

contains
  
  function sairy(x, flags) result(abi)
    use set_precision, only: wp => skind ! from working_precision.f95
    use airy_functions_real_single ! from airy_functions.f90

    include 'real'

    write(*, '(A/A, 1PE24.16, 2I6)') &
         'Exception for single precision Airy', &
         'Values of X, flags for airy_ai, airy_bi', x, ierra, ierrb
    
  end function sairy

  function dairy(x, flags) result(abi)
    use set_precision, only: wp => dkind
    use airy_functions_real_double ! from airy_function.f90

    include 'real'

    write(*, '(A/A, 1PE24.16, 2I6)') &
         'Exception for double precision Airy', &
         'Values of X, flags for airy_ai, airy_bi', x, ierra, ierrb

  end function dairy

  function cairy(z, flags) result(abi)
    use set_precision, only: wp => skind
    use airy_functions_complex_single ! from airy_function.f90

    include 'complex'
    
    write(*, '(A/A, 1P2E16.8, 3I6)') &
         'Exception for complex single precision airy', &
         'Values of z, flags for airy_ai', z, ierra, ierrb, ierrc
    
  end function cairy
  
  function zairy(z, flags) result(abi)
    use set_precision, only: wp => dkind
    use airy_functions_complex_double ! form airy_function.f90

    include 'complex'

    write(*, '(A, A, 1P2E16.8, 3I6)') &
         'Exception for complex double precision airy', &
         'Values of z, flags for airy_ai', z, ierra, ierrb, ierrc
  end function zairy
  
end module ai_and_bi

