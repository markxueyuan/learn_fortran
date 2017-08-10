module set_precision

    intrinsic kind
! For IEEE standard arithmetic we could also use
!   integer, parameter :: skind = selected_real_kind(p=6, r=37)
!   integer, parameter :: dkind = selected_real_kind(p=15, r=307)
    integer, parameter :: skind = kind(0.0E0)
    integer, parameter :: dkind = kind(0.0D0)
    integer, parameter :: qkind = 10
    integer, parameter :: qqkind = 16
! Set working precision
    integer, parameter :: wp = dkind

end module
