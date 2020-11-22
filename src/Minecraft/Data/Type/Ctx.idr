module Minecraft.Data.Type.Ctx

%default total

public export
record Ctx kind where
  constructor (#)
  type : Type 
  {auto impl : kind type}

public export
record Impl kind (type : Type) where
  constructor Inst
  {auto impl : kind type}
