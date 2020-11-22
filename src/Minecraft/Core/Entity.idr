module Minecraft.Core.Entity

import Minecraft.Core

%default total

public export
record Entity (self : Type) where
  constructor MkEntity
