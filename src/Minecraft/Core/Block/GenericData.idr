module Minecraft.Core.Block.GenericData

%default total

public export
record GenericBlockData where
  constructor MkBlock
  {auto waterLogged : Bool}
