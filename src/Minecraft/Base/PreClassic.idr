module Minecraft.Base.PreClassic

import public Minecraft.Base.PreClassic.Air.Export
import public Minecraft.Base.PreClassic.Cobblestone.Export
import public Minecraft.Base.PreClassic.Dirt.Export
import public Minecraft.Base.PreClassic.GrassBlock.Export
import public Minecraft.Base.PreClassic.Stone.Export
import public Minecraft.Core.Univ

%default total

exists : String -> Maybe (Ctx Deserialize)
exists "Air.Block"         = Just ((#) Air.Block)
exists "Cobblestone.Block" = Just ((#) Cobblestone.Block)
exists "Dirt.Block"        = Just ((#) Dirt.Block)
exists "GrassBlock.Block"  = Just ((#) GrassBlock.Block)
exists "Stone.Block"       = Just ((#) Stone.Block)
exists _ = Nothing

reflect : (ty : Type) -> Maybe (Vtbl ty)
reflect Air.Block         = Just %search
reflect Cobblestone.Block = Just %search
reflect Dirt.Block        = Just %search
reflect GrassBlock.Block  = Just %search
reflect Stone.Block       = Just %search
reflect _ = Nothing

export
preClassic : Univ
preClassic = MkUniv exists reflect
