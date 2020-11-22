module Minecraft.Core

%default total

-- Forward declaractions for potential recursive interfaces
namespace Block
  public export data Block : (self : Type) -> Type
namespace Entity
  public export data Entity : (self : Type) -> Type
  namespace Pickup
    public export data Pickup : (self : Type) -> Type
namespace Item
  public export data Item : (self : Type) -> Type
  namespace Put
    public export data Put : (self : Type) -> Type
namespace Tangible
  public export data Tangible : (self : Type) -> Type
