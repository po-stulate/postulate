module Minecraft.Base.PreClassic.Dirt.Item

import public Minecraft.Base.PreClassic.Dirt
import public Minecraft.Core.Item.Export
import public Minecraft.Core.Item.Put.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint dirtItem : Item Dirt.Item
  public export %hint putDirt  : Put  Dirt.Item
  public export %hint dirtVtbl : Vtbl Dirt.Item
