module Minecraft.Base.PreClassic.Cobblestone.Item.Export

import public Minecraft.Core.Entity.Pickup.Export
import public Minecraft.Base.PreClassic.Cobblestone.Block
import public Minecraft.Base.PreClassic.Cobblestone.Item
import public Minecraft.Base.PreClassic.Cobblestone.ItemEntity

%default total

[cobblestoneItem']
Item Cobblestone.Item where
  id = "minecraft:cobblestone"
  stackable = Just 64
  givenName = \x => x.base.givenName
  proj = \x => new Cobblestone.ItemEntity Cobblestone.MkItemEntity

[putCobblestone']
Put Cobblestone.Item where
  putItem self = new Cobblestone.Block Cobblestone.MkBlock

[cobblestoneVtbl']
Vtbl Cobblestone.Item where
  vtable (Item Cobblestone.Item) = Just cobblestoneItem
  vtable (Put  Cobblestone.Item) = Just putCobblestone
  vtable _ = Nothing

cobblestoneItem = cobblestoneItem'
putCobblestone  = putCobblestone'
cobblestoneVtbl = cobblestoneVtbl'
