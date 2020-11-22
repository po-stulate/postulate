module Minecraft.Base.PreClassic.GrassBlock.Item.Export

import public Minecraft.Core.Entity.Pickup.Export
import public Minecraft.Base.PreClassic.GrassBlock.Block
import public Minecraft.Base.PreClassic.GrassBlock.Item
import public Minecraft.Base.PreClassic.GrassBlock.ItemEntity

%default total

[grassBlockItem']
Item GrassBlock.Item where
  id = "minecraft:grass_block"
  stackable = Just 64
  givenName = \x => x.base.givenName
  proj = \x => new GrassBlock.ItemEntity GrassBlock.MkItemEntity

[putGrassBlock']
Put GrassBlock.Item where
  putItem self = new GrassBlock.Block GrassBlock.MkBlock

[grassBlockVtbl']
Vtbl GrassBlock.Item where
  vtable (Item GrassBlock.Item) = Just grassBlockItem
  vtable (Put  GrassBlock.Item) = Just putGrassBlock
  vtable _ = Nothing

grassBlockItem = grassBlockItem'
putGrassBlock  = putGrassBlock'
grassBlockVtbl = grassBlockVtbl'
