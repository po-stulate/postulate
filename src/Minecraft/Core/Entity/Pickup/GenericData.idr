module Minecraft.Core.Entity.Pickup.GenericData

%default total

public export
record GenericItemEntityData (i : Type) where
  constructor MkItemEntity
  item : i
