module Minecraft.Base.PreClassic.Dirt.Block.Export

import public Minecraft.Core.Entity
import public Minecraft.Base.PreClassic.Dirt.Block
import public Minecraft.Base.PreClassic.Dirt.Item
import public Minecraft.Base.PreClassic.Dirt.ItemEntity

%default total

public export
Eq Dirt.Block where
  x == y = True

public export
Serialize Dirt.Block where
  identifier = "Dirt.Block"
  serialize x = JObject [
    ("waterLogged", JBoolean x.base.waterLogged)
  ]

public export
Deserialize Dirt.Block where
  deserialize (JObject [
    ("waterLogged", JBoolean waterLogged)
  ]) = Just $ Dirt.MkBlock {base = (GenericData.MkBlock {waterLogged = waterLogged})}
  deserialize _ = Nothing

[dirtBlock']
Block Dirt.Block where
  id = Item.id {self = Dirt.Item}

[breakDirt']
Break Dirt.Block where
  breakBlk self = [new Dirt.ItemEntity Dirt.MkItemEntity]

[dirtVtbl']
Vtbl Dirt.Block where
  vtable (Block    Dirt.Block) = Just dirtBlock
  vtable (Break    Dirt.Block) = Just breakDirt
  vtable (Tangible Dirt.Block) = Just %search
  vtable _ = Nothing

dirtBlock = dirtBlock'
breakDirt = breakDirt'
dirtVtbl  = dirtVtbl'
