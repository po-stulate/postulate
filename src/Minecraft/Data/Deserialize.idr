module Minecraft.Data.Deserialize

import public Minecraft.Data.Serialize

%default total

public export
interface Serialize a => Deserialize a where
  deserialize : JSON -> Maybe a

public export
deserializeSerialize : Deserialize a -> Serialize a
deserializeSerialize = %search
