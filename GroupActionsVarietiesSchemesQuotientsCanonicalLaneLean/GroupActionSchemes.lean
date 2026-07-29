import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure GroupActionScheme {G : Type u} [Group G] {X : Type v} [Scheme X] where
  actionMap : G → X → X
  actionCompatible : ∀ g h x, actionMap (g * h) x = actionMap g (actionMap h x)
  actionMorphism : ∀ g, IsMorphism (λ x : X => actionMap g x)
  quotientScheme : Scheme
  quotientMap : X → quotientScheme
  quotientUniversal : ∀ (Y : Scheme) (f : X → Y) (h : ∀ g x, f (actionMap g x) = f x), ∃! φ : quotientScheme → Y, φ ∘ quotientMap = f

structure GroupActionSchemeEvidence {G : Type u} [Group G] {X : Type v} [Scheme X] (A : GroupActionScheme G X) where
  actionCompatibleClosed : A.actionCompatible
  actionMorphismClosed : A.actionMorphism
  quotientUniversalClosed : A.quotientUniversal

def GroupActionSchemeClosed {G : Type u} [Group G] {X : Type v} [Scheme X] (A : GroupActionScheme G X) : Prop :=
  A.actionCompatible ∧ A.actionMorphism ∧ A.quotientUniversal

theorem group_action_scheme_closed_from_evidence {G : Type u} [Group G] {X : Type v} [Scheme X]
    (A : GroupActionScheme G X) (E : GroupActionSchemeEvidence A) : GroupActionSchemeClosed A :=
  And.intro E.actionCompatibleClosed (And.intro E.actionMorphismClosed E.quotientUniversalClosed)

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse
