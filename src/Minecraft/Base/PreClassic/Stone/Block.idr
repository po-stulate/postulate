module Minecraft.Base.PreClassic.Stone.Block

import public Minecraft.Base.PreClassic.Stone
import public Minecraft.Core.Block.Export
import public Minecraft.Core.Block.Break.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint stoneBlock : Block Stone.Block
  public export %hint breakStone : Break Stone.Block
  public export %hint stoneVtbl  : Vtbl  Stone.Block
