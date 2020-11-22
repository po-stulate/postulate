module Minecraft.Base.PreClassic.Dirt.ItemEntity.Export

import public Minecraft.Core.Entity.Export
import public Minecraft.Base.PreClassic.Dirt.Item
import public Minecraft.Base.PreClassic.Dirt.ItemEntity

%default total

[dirtItemEntity']
Pickup Dirt.ItemEntity where
  collect self = new Dirt.Item self.base.item

[dirtVtbl']
Vtbl Dirt.ItemEntity where
  vtable (Pickup   Dirt.ItemEntity) = Just dirtItemEntity
  vtable (Entity   Dirt.ItemEntity) = Just %search
  vtable (Tangible Dirt.ItemEntity) = Just %search
  vtable _ = Nothing

dirtItemEntity = dirtItemEntity'
dirtVtbl = dirtVtbl'
