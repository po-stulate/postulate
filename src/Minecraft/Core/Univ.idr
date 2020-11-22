module Minecraft.Core.Univ

import public Minecraft.Data.Deserialize
import public Minecraft.Data.Type.Ctx
import public Minecraft.Data.Type.Vtbl

%default total

public export
record Univ where
  constructor MkUniv
  exists : String -> Maybe (Ctx Deserialize)
  reflect : (ty : Type) -> Maybe (Vtbl ty)
