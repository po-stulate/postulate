module Minecraft.Base.PreClassic.Dirt

import public Minecraft.Core.Block.GenericData
import public Minecraft.Core.Entity.Pickup.GenericData
import public Minecraft.Core.Item.GenericData

%default total

public export
record Block where
  constructor MkBlock
  {auto base : GenericBlockData}

public export
record Item where
  constructor MkItem
  {auto base : GenericItemData}

public export
record ItemEntity where
  constructor MkItemEntity
  {auto base : GenericItemEntityData Dirt.Item}
