module Minecraft.Base.PreClassic.Air.Block

import public Minecraft.Base.PreClassic.Air
import public Minecraft.Core.Block.Export
import public Minecraft.Data.Type.Vtbl

%default total

namespace Export
  public export %hint airBlock : Block Air.Block
  public export %hint airVtbl  : Vtbl  Air.Block
