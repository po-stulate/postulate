module Minecraft.Base.PreClassic.Dirt.Item.Export

import public Minecraft.Core.Entity.Pickup.Export
import public Minecraft.Base.PreClassic.Dirt.Block
import public Minecraft.Base.PreClassic.Dirt.Item
import public Minecraft.Base.PreClassic.Dirt.ItemEntity

%default total

[dirtItem']
Item Dirt.Item where
  id = "minecraft:dirt"
  stackable = Just 64
  givenName = \x => x.base.givenName
  proj = \x => new Dirt.ItemEntity Dirt.MkItemEntity

[putDirt']
Put Dirt.Item where
  putItem self = new Dirt.Block Dirt.MkBlock

[dirtVtbl']
Vtbl Dirt.Item where
  vtable (Item Dirt.Item) = Just dirtItem
  vtable (Put  Dirt.Item) = Just putDirt
  vtable _ = Nothing

dirtItem = dirtItem'
putDirt  = putDirt'
dirtVtbl = dirtVtbl'
