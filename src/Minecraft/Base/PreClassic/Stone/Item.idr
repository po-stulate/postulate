module Minecraft.Base.PreClassic.Stone.Item

import public Minecraft.Base.PreClassic.Stone
import public Minecraft.Core.Item.Export
import public Minecraft.Core.Item.Put.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint stoneItem : Item Stone.Item
  public export %hint putStone  : Put  Stone.Item
  public export %hint stoneVtbl : Vtbl Stone.Item
