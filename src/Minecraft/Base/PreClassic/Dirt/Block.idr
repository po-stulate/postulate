module Minecraft.Base.PreClassic.Dirt.Block

import public Minecraft.Base.PreClassic.Dirt
import public Minecraft.Core.Block.Export
import public Minecraft.Core.Block.Break.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint dirtBlock : Block Dirt.Block
  public export %hint breakDirt : Break Dirt.Block
  public export %hint dirtVtbl  : Vtbl  Dirt.Block
