module Minecraft.Core.Entity.Pickup

import Minecraft.Core
import public Minecraft.Data.Type.As

%default total

public export
interface Entity e => Pickup (e : Type) where
  collect : e -> Inf (As Item)
