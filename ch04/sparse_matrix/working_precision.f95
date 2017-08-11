module set_precision

intrinsic kind
integer, parameter :: skind = kind(0.0E0)
integer, parameter :: dkind = kind(0.0D0)
integer, parameter :: qkind = 10
integer, parameter :: qqkind = 16
integer, parameter :: wp = dkind
end module
