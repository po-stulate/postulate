module Minecraft.Core.Item.Put

import public Minecraft.Core.Item
import public Minecraft.Core.Tangible
import public Minecraft.Data.Type.As

%default total

public export
interface Item self => Put (self : Type) where
  putItem : self -> As Tangible
