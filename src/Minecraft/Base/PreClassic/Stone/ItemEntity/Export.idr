module Minecraft.Base.PreClassic.Stone.ItemEntity.Export

import public Minecraft.Core.Entity.Export
import public Minecraft.Base.PreClassic.Stone.Item
import public Minecraft.Base.PreClassic.Stone.ItemEntity

%default total

[stoneItemEntity']
Pickup Stone.ItemEntity where
  collect self = new Stone.Item self.base.item

[stoneVtbl']
Vtbl Stone.ItemEntity where
  vtable (Pickup   Stone.ItemEntity) = Just stoneItemEntity
  vtable (Entity   Stone.ItemEntity) = Just %search
  vtable (Tangible Stone.ItemEntity) = Just %search
  vtable _ = Nothing

stoneItemEntity = stoneItemEntity'
stoneVtbl = stoneVtbl'
