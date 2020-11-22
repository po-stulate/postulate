module Minecraft.Base.PreClassic.Cobblestone.ItemEntity

import public Minecraft.Base.PreClassic.Cobblestone
import public Minecraft.Core.Entity.Pickup.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint cobblestoneItemEntity : Pickup Cobblestone.ItemEntity
  public export %hint cobblestoneVtbl       : Vtbl   Cobblestone.ItemEntity
