module Minecraft.Data.Type.Vtbl

%default total

public export
interface Vtbl (a : Type) where
  vtable : (constraint : Type) -> Maybe constraint
