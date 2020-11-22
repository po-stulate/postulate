module Minecraft.Client.Main

import Minecraft.Base.PreClassic
import Minecraft.Core.Univ.Level

%default total

public export
it : As Item
it = new Stone.Item MkItem

public export
blk : As Tangible
blk = case castApp Put it putItem of
  Just blk' => blk'
  Nothing   => believe_me ()

public export
es : Maybe (List (As Entity))
es = castApp Break blk breakBlk

public export
e : As Entity
e = case es of
  Just (x :: xs) => x
  _ => believe_me ()

public export
it' : As Item
it' = case castApp Pickup e collect of
  Just x  => x
  Nothing => believe_me "nothing"

public export
b1 : As Block
b1 = new Cobblestone.Block MkBlock

public export
b2 : As Block
b2 = new Cobblestone.Block MkBlock

public export
main : IO ()
main = do
  pure ()
