module Minecraft.Core.Item.GenericData

%default total

public export
record GenericItemData where
  constructor MkItem
  {auto givenName : Maybe String}
