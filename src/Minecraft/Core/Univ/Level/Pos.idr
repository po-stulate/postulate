module Minecraft.Core.Univ.Level.Pos

%default total

public export
record Pos where
  constructor At
  {chunk : Bits64}
  x, y, z : Bits8
