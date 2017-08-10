module airy
  use airy_functions_real_single
  use airy_functions_real_double
  use airy_functions_complex_single
  use airy_functions_complex_double

  private
  public :: airy_ai, airy_bi, airy_ai_zero, airy_bi_zero
  public :: airy_info, airy_aux, airy_aux_info

end module airy

