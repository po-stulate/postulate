module Minecraft.Base.PreClassic.Cobblestone.Block.Export

import public Minecraft.Core.Entity
import public Minecraft.Base.PreClassic.Cobblestone.Block
import public Minecraft.Base.PreClassic.Cobblestone.Item
import public Minecraft.Base.PreClassic.Cobblestone.ItemEntity

%default total

public export
Eq Cobblestone.Block where
  x == y = True

public export
Serialize Cobblestone.Block where
  identifier = "Cobblestone.Block"
  serialize x = JObject [
    ("waterLogged", JBoolean x.base.waterLogged)
  ]

public export
Deserialize Cobblestone.Block where
  deserialize (JObject [
    ("waterLogged", JBoolean waterLogged)
  ]) = Just $ Cobblestone.MkBlock {base = (GenericData.MkBlock {waterLogged = waterLogged})}
  deserialize _ = Nothing

[cobblestoneBlock']
Block Cobblestone.Block where
  id = Item.id {self = Cobblestone.Item}

[breakCobblestone']
Break Cobblestone.Block where
  breakBlk self = [new Cobblestone.ItemEntity Cobblestone.MkItemEntity]

[cobblestoneVtbl']
Vtbl Cobblestone.Block where
  vtable (Block    Cobblestone.Block) = Just cobblestoneBlock
  vtable (Break    Cobblestone.Block) = Just breakCobblestone
  vtable (Tangible Cobblestone.Block) = Just %search
  vtable _ = Nothing

cobblestoneBlock = cobblestoneBlock'
breakCobblestone = breakCobblestone'
cobblestoneVtbl  = cobblestoneVtbl'
