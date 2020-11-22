module Minecraft.Base.PreClassic.Stone.Block.Export

import public Minecraft.Core.Entity
import public Minecraft.Base.PreClassic.Stone.Block
import public Minecraft.Base.PreClassic.Stone.Item
import public Minecraft.Base.PreClassic.Cobblestone.ItemEntity

%default total

public export
Eq Stone.Block where
  x == y = True

public export
Serialize Stone.Block where
  identifier = "Stone.Block"
  serialize x = JObject [
    ("waterLogged", JBoolean x.base.waterLogged)
  ]

public export
Deserialize Stone.Block where
  deserialize (JObject [
    ("waterLogged", JBoolean waterLogged)
  ]) = Just $ Stone.MkBlock {base = (GenericData.MkBlock {waterLogged = waterLogged})}
  deserialize _ = Nothing

[stoneBlock']
Block Stone.Block where
  id = Item.id {self = Stone.Item}

[breakStone']
Break Stone.Block where
  breakBlk self = [new Cobblestone.ItemEntity Cobblestone.MkItemEntity]

[stoneVtbl']
Vtbl Stone.Block where
  vtable (Block    Stone.Block) = Just stoneBlock
  vtable (Break    Stone.Block) = Just breakStone
  vtable (Tangible Stone.Block) = Just %search
  vtable _ = Nothing

stoneBlock = stoneBlock'
breakStone = breakStone'
stoneVtbl  = stoneVtbl'
