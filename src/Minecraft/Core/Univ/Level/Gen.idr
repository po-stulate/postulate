module Minecraft.Core.Univ.Level.Gen

import public Minecraft.Core.Block
import public Minecraft.Core.Univ
import public Minecraft.Core.Univ.Level.Pos
import public Minecraft.Data.Type.As

%default total

public export
record LevelGen (seed : Bits64) (univ : Univ) (voidBlock : As Block) where
  constructor MkLevelGen
  blockAt : Pos -> As Block
