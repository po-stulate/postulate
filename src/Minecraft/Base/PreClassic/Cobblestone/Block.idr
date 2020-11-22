module Minecraft.Base.PreClassic.Cobblestone.Block

import public Minecraft.Base.PreClassic.Cobblestone
import public Minecraft.Core.Block.Export
import public Minecraft.Core.Block.Break.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint cobblestoneBlock : Block Cobblestone.Block
  public export %hint breakCobblestone : Break Cobblestone.Block
  public export %hint cobblestoneVtbl  : Vtbl  Cobblestone.Block
