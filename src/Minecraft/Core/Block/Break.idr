module Minecraft.Core.Block.Break

import Minecraft.Core
import public Minecraft.Core.Block
import public Minecraft.Data.Type.As

%default total

public export
interface Block self => Break (self : Type) where
  breakBlk : self -> List (As Entity)
