module Minecraft.Base.PreClassic.GrassBlock.Item

import public Minecraft.Base.PreClassic.GrassBlock
import public Minecraft.Core.Item.Export
import public Minecraft.Core.Item.Put.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint grassBlockItem : Item GrassBlock.Item
  public export %hint putGrassBlock  : Put  GrassBlock.Item
  public export %hint grassBlockVtbl : Vtbl GrassBlock.Item
