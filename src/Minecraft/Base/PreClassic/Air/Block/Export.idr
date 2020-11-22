module Minecraft.Base.PreClassic.Air.Block.Export

import public Minecraft.Core.Entity
import public Minecraft.Base.PreClassic.Air.Block

%default total

public export
Eq Air.Block where
  x == y = True

public export
Serialize Air.Block where
  identifier = "Air.Block"
  serialize x = JNull

public export
Deserialize Air.Block where
  deserialize _ = Just $ Air.MkBlock

[airBlock']
Block Air.Block where
  id = "minecraft:air"

[airVtbl']
Vtbl Air.Block where
  vtable (Block    Air.Block) = Just airBlock
  vtable (Tangible Air.Block) = Just %search
  vtable _ = Nothing

airBlock = airBlock'
airVtbl  = airVtbl'
