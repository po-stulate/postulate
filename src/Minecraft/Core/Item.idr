module Minecraft.Core.Item

import Minecraft.Core
import public Minecraft.Data.Type.As

%default total

public export
interface Item (self : Type) where
  id : String
  stackable : Maybe Nat
  givenName : self -> Maybe String
  proj : self -> Inf (As Pickup)
