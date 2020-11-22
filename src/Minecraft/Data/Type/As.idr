module Minecraft.Data.Type.As

import public Minecraft.Data.Type.Ctx
import public Minecraft.Data.Type.Vtbl

%default total

public export
record As kind where
  constructor New
  ctx : Ctx kind
  val : ctx.type
  {auto vtbl : Vtbl ctx.type}

export
new : {kind : Type -> Type} -> (type : Type) -> (val : type) -> (impl : kind type) => (vtbl : Vtbl type) => As kind
new {kind} type val @{impl} @{vtbl} = New ((#) type @{impl}) val @{vtbl}

export
app : forall r. {kind : Type -> Type} -> (x : As kind) -> (f : kind x.ctx.type => x.ctx.type -> r) -> r
app {kind} x f = f @{x.ctx.impl} x.val

export
cast : (kind : Type -> Type) -> As _ -> Maybe (As kind)
cast kind (New ctx val {vtbl}) = case vtable @{vtbl} (kind ctx.type) of
  Just impl => Just (New ((#) ctx.type {impl}) val @{vtbl})
  Nothing => Nothing

export
castApp : forall r. (kind : Type -> Type) -> (x : As _) -> (f : kind x.ctx.type => x.ctx.type -> r) -> Maybe r
castApp kind  (New ctx val {vtbl}) f = case vtable @{vtbl} (kind ctx.type) of
  Just impl => Just (f @{impl} val)
  Nothing => Nothing
