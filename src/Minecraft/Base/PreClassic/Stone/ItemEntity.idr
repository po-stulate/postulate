module Minecraft.Base.PreClassic.Stone.ItemEntity

import public Minecraft.Base.PreClassic.Stone
import public Minecraft.Core.Entity.Pickup.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint stoneItemEntity : Pickup Stone.ItemEntity
  public export %hint stoneVtbl       : Vtbl   Stone.ItemEntity
