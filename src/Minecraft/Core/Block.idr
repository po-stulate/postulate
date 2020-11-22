module Minecraft.Core.Block

import Minecraft.Core
import public Minecraft.Data.Deserialize
import public Minecraft.Data.Type.Ctx

%default total

public export
interface Eq self => Deserialize self => Block (self : Type) where
  id : String

public export
blockDeserialize : Block b -> Deserialize b
blockDeserialize = %search

public export
blockSerialize : Block b -> Serialize b
blockSerialize = %search
