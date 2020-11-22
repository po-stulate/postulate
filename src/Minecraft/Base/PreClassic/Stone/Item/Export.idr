module Minecraft.Base.PreClassic.Stone.Item.Export

import public Minecraft.Core.Entity.Pickup.Export
import public Minecraft.Base.PreClassic.Stone.Block
import public Minecraft.Base.PreClassic.Stone.Item
import public Minecraft.Base.PreClassic.Stone.ItemEntity

%default total

[stoneItem']
Item Stone.Item where
  id = "minecraft:stone"
  stackable = Just 64
  givenName = \x => x.base.givenName
  proj = \x => new Stone.ItemEntity Stone.MkItemEntity

[putStone']
Put Stone.Item where
  putItem self = new Stone.Block Stone.MkBlock

[stoneVtbl']
Vtbl Stone.Item where
  vtable (Item Stone.Item) = Just stoneItem
  vtable (Put  Stone.Item) = Just putStone
  vtable _ = Nothing

stoneItem = stoneItem'
putStone  = putStone'
stoneVtbl = stoneVtbl'
