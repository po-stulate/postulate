module Minecraft.Base.PreClassic.Dirt.ItemEntity

import public Minecraft.Base.PreClassic.Dirt
import public Minecraft.Core.Entity.Pickup.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint dirtItemEntity : Pickup Dirt.ItemEntity
  public export %hint dirtVtbl       : Vtbl   Dirt.ItemEntity
