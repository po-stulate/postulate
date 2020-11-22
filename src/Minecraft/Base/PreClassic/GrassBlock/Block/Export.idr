module Minecraft.Base.PreClassic.GrassBlock.Block.Export

import public Minecraft.Core.Entity
import public Minecraft.Base.PreClassic.Dirt.ItemEntity
import public Minecraft.Base.PreClassic.GrassBlock.Block
import public Minecraft.Base.PreClassic.GrassBlock.Item

%default total

public export
Eq GrassBlock.Block where
  x == y = True

public export
Serialize GrassBlock.Block where
  identifier = "GrassBlock.Block"
  serialize x = JObject [
    ("waterLogged", JBoolean x.base.waterLogged)
  ]

public export
Deserialize GrassBlock.Block where
  deserialize (JObject [
    ("waterLogged", JBoolean waterLogged)
  ]) = Just $ GrassBlock.MkBlock {base = (GenericData.MkBlock {waterLogged = waterLogged})}
  deserialize _ = Nothing

[grassBlockBlock']
Block GrassBlock.Block where
  id = Item.id {self = GrassBlock.Item}

[breakGrassBlock']
Break GrassBlock.Block where
  breakBlk self = [new Dirt.ItemEntity Dirt.MkItemEntity]

[grassBlockVtbl']
Vtbl GrassBlock.Block where
  vtable (Block    GrassBlock.Block) = Just grassBlockBlock
  vtable (Break    GrassBlock.Block) = Just breakGrassBlock
  vtable (Tangible GrassBlock.Block) = Just %search
  vtable _ = Nothing

grassBlockBlock = grassBlockBlock'
breakGrassBlock = breakGrassBlock'
grassBlockVtbl  = grassBlockVtbl'
