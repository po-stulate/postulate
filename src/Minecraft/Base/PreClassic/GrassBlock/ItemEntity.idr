module Minecraft.Base.PreClassic.GrassBlock.ItemEntity

import public Minecraft.Base.PreClassic.GrassBlock
import public Minecraft.Core.Entity.Pickup.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint grassBlockItemEntity : Pickup GrassBlock.ItemEntity
  public export %hint grassBlockVtbl       : Vtbl   GrassBlock.ItemEntity
