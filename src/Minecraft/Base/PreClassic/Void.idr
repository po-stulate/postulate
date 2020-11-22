module Minecraft.Base.PreClassic.Void

import public Minecraft.Core.Univ.Level.Gen
import public Minecraft.Base.PreClassic

%default total

public export %hint
voidGen : (seed : Bits64) => LevelGen seed preClassic (new Air.Block MkBlock)
voidGen @{seed} = MkLevelGen blockAt where
  blockAt : Pos -> As Block
  blockAt (At 31 60 31 {chunk = 9223372036854775807}) = new Cobblestone.Block MkBlock
  blockAt (At x  60 z  {chunk = 9223372036854775807}) =
    if x <= 47 && x >= 15 && z <= 47 && z >= 15
      then new Stone.Block MkBlock
      else new Air.Block MkBlock
  blockAt _ = new Air.Block MkBlock
