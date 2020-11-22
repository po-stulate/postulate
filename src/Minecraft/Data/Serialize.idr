module Minecraft.Data.Serialize

import public Language.JSON

%default total

public export
interface Serialize a where
  identifier : String
  serialize : a -> JSON
