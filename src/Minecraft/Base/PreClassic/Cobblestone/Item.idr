module Minecraft.Base.PreClassic.Cobblestone.Item

import public Minecraft.Base.PreClassic.Cobblestone
import public Minecraft.Core.Item.Export
import public Minecraft.Core.Item.Put.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint cobblestoneItem : Item Cobblestone.Item
  public export %hint putCobblestone  : Put  Cobblestone.Item
  public export %hint cobblestoneVtbl : Vtbl Cobblestone.Item
