module Minecraft.Base.PreClassic.GrassBlock.ItemEntity.Export

import public Minecraft.Core.Entity.Export
import public Minecraft.Base.PreClassic.GrassBlock.Item
import public Minecraft.Base.PreClassic.GrassBlock.ItemEntity

%default total

[grassBlockItemEntity']
Pickup GrassBlock.ItemEntity where
  collect self = new GrassBlock.Item self.base.item

[grassBlockVtbl']
Vtbl GrassBlock.ItemEntity where
  vtable (Pickup GrassBlock.ItemEntity) = Just grassBlockItemEntity
  vtable (Entity GrassBlock.ItemEntity) = Just %search
  vtable _ = Nothing

grassBlockItemEntity = grassBlockItemEntity'
grassBlockVtbl = grassBlockVtbl'
