module Minecraft.Base.PreClassic.GrassBlock.Block

import public Minecraft.Base.PreClassic.GrassBlock
import public Minecraft.Core.Block.Export
import public Minecraft.Core.Block.Break.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint grassBlockBlock : Block GrassBlock.Block
  public export %hint breakGrassBlock : Break GrassBlock.Block
  public export %hint grassBlockVtbl  : Vtbl  GrassBlock.Block
