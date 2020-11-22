module Minecraft.Core.Univ.Level

import Data.IOArray
import public Minecraft.Data.Type.As
import public Minecraft.Core.Block.Export
import public Minecraft.Core.Univ
import public Minecraft.Core.Univ.Level.Gen
import public Minecraft.Core.Univ.Level.Pos

%default total

%foreign "C:block_at,level"
block_at : (level_id : String)
        -> (chunk_id : Bits64)
        -> (x : Bits8)
        -> (y : Bits8)
        -> (z : Bits8)
        -> Int -- block data index
%foreign "C:put_block,level"
put_block : (level_id : String)
         -> (chunk_id : Bits64)
         -> (x : Bits8)
         -> (y : Bits8)
         -> (z : Bits8)
         -> (new_val : Int)
         -> Int -- old val
%foreign "C:save_chunk,level"
save_chunk : (level_id : String)
          -> (chunk_id : Bits64)
          -> (identifier : Int -> String)
          -> (serialize : Int -> String)
          -> ()
%foreign "C:save_level,level"
save_level : (level_id : String)
          -> (serialize : Int -> String)
          -> ()
%foreign "C:load_level,level"
load_level : (level_id : String)
          -> (load_blk : (idx : Int) -> (identifier : String) -> (serialized : String) -> ())
          -> ()
-- %foreign "C:load_chunk,level"
-- load_chunk : (level_id : String)
--           -> (chunk_id : Bits64)
--           -> ()

public export
Eq (As Block) where
  x == y = if Block.id @{x.ctx.impl} == Block.id @{y.ctx.impl}
    then (==) @{blkEq x.ctx.impl} x.val (believe_me y.val)
    else False
  where
    blkEq : Block a -> Eq a
    blkEq = %search

find : Eq a => a -> IOArray a -> IO (Maybe Int)
find x xs = find' (integerToNat (cast (max xs))) where
  find' : Nat -> IO (Maybe Int)
  find' Z = pure Nothing
  find' (S n) = do
    y <- readArray xs (cast (S n))
    if Just x == y
      then pure (Just (cast (S n)))
      else find' n

export
record Level where
  constructor MkLevel
  id : String
  seed : Bits64
  univ : Univ
  voidBlock : As Block
  gen : LevelGen seed univ voidBlock
  blocks : IOArray (As Block)
  {auto blocksTop : Int}

-- TODO: dynamic growth logic for level.blocks
export
updateAt : Level -> Pos -> As Block -> IO Level
updateAt level pos blk = do
  idx <- find blk level.blocks
  case idx of
    Just idx => do
      pure $ put_block level.id pos.chunk pos.x pos.y pos.z idx
      pure level
    Nothing  => do
      writeArray level.blocks level.blocksTop blk
      pure $ put_block level.id pos.chunk pos.x pos.y pos.z level.blocksTop
      pure $ record {blocksTop $=(+1)} level

export
blockAt : Level -> Pos -> IO (As Block)
blockAt level pos = do
  case block_at level.id pos.chunk pos.x pos.y pos.z of
    0 => do
      blk <- pure (level.gen.blockAt pos)
      updateAt level pos blk
      pure blk
    n => do
      blk <- readArray level.blocks n
      case blk of
        Just blk => pure blk
        Nothing  => pure level.voidBlock

serializeBlock : (level : Level)
              -> (idx : Int)
              -> String
serializeBlock level idx = case unsafePerformIO (readArray level.blocks idx) of
  Just blk => serialize' blk
  Nothing  => serialize' level.voidBlock
  where
    serialize' : As Block -> String
    serialize' blk = show $ Serialize.serialize @{blockSerialize blk.ctx.impl} blk.val

identifier : (level : Level)
          -> (idx : Int)
          -> String
identifier level idx = case unsafePerformIO (readArray level.blocks idx) of
  Just blk => identifier' blk
  Nothing  => identifier' level.voidBlock
  where
    identifier' : As Block -> String
    identifier' blk = Serialize.identifier @{blockSerialize blk.ctx.impl}

deserializeBlock : (level : Level)
                => (idx : Int)
                -> (identifier : String)
                -> (serialized : String)
                -> ()
deserializeBlock @{level} idx identifier serialized =
  unsafePerformIO $ writeArray level.blocks idx blk
  where
    context : Maybe (Ctx Deserialize)
    context = level.univ.exists identifier

    blk : As Block
    blk = case context of
      Just ctx => case level.univ.reflect ctx.type of
        Just vtbl => case parse serialized of
          Just json => case vtable @{vtbl} (Block ctx.type) of
            Just impl => case Deserialize.deserialize @{ctx.impl} json of
              Just block => new ctx.type block @{impl}
              Nothing => level.voidBlock
            Nothing => level.voidBlock
          Nothing => level.voidBlock
        Nothing => level.voidBlock
      Nothing => level.voidBlock

export
saveChunk : (level : Level)
         -> (chunkId : Bits64)
         -> IO ()
saveChunk level chunkId = do
  pure $ save_chunk level.id chunkId (identifier level) (serializeBlock level)

export
saveLevel : (level : Level) -> IO ()
saveLevel level = pure $ save_level level.id (serializeBlock level)

export
loadLevel : (level : Level) -> IO Level
loadLevel level = do
  pure $ load_level level.id (deserializeBlock @{level})
  pure level

export
level : (id : String)
     -> (seed : Bits64)
     -> (univ : Univ)
     -> (voidBlock : As Block)
     -> (gen : LevelGen seed univ voidBlock)
     -> IO Level
level id seed univ voidBlock gen = do
  blocks <- newArray 256
  writeArray blocks 1 voidBlock
  loadLevel $ MkLevel id seed univ voidBlock gen blocks {blocksTop = 1}
