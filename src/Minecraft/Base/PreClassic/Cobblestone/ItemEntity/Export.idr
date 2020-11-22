module Minecraft.Base.PreClassic.Cobblestone.ItemEntity.Export

import public Minecraft.Core.Entity.Export
import public Minecraft.Base.PreClassic.Cobblestone.Item
import public Minecraft.Base.PreClassic.Cobblestone.ItemEntity

%default total

[cobblestoneItemEntity']
Pickup Cobblestone.ItemEntity where
  collect self = new Cobblestone.Item self.base.item

[cobblestoneVtbl']
Vtbl Cobblestone.ItemEntity where
  vtable (Pickup   Cobblestone.ItemEntity) = Just cobblestoneItemEntity
  vtable (Entity   Cobblestone.ItemEntity) = Just %search
  vtable (Tangible Cobblestone.ItemEntity) = Just %search
  vtable _ = Nothing

cobblestoneItemEntity = cobblestoneItemEntity'
cobblestoneVtbl = cobblestoneVtbl'
