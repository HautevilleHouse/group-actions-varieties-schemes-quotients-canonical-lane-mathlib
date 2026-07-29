import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure QuotientVariety {G : Type u} [AlgebraicGroup G] {V : Type v} [Variety V] where
  action : G → V → V
  actionRegular : ∀ g, IsRegular (λ x : V => action g x)
  quotientObject : Variety
  quotientMorphism : V → quotientObject
  quotientProperty : ∀ (W : Variety) (f : V → W) (h : ∀ g x, f (action g x) = f x), ∃! φ : quotientObject → W, φ ∘ quotientMorphism = f
  categoricalQuotientProperty : IsEpimorphism quotientMorphism ∧ IsCategoricalQuotient action quotientMorphism

structure QuotientVarietyEvidence {G : Type u} [AlgebraicGroup G] {V : Type v} [Variety V] (Q : QuotientVariety G V) where
  actionRegularClosed : Q.actionRegular
  quotientPropertyClosed : Q.quotientProperty
  categoricalQuotientPropertyClosed : Q.categoricalQuotientProperty

def QuotientVarietyClosed {G : Type u} [AlgebraicGroup G] {V : Type v} [Variety V] (Q : QuotientVariety G V) : Prop :=
  Q.actionRegular ∧ Q.quotientProperty ∧ Q.categoricalQuotientProperty

theorem quotient_variety_closed_from_evidence {G : Type u} [AlgebraicGroup G] {V : Type v} [Variety V]
    (Q : QuotientVariety G V) (E : QuotientVarietyEvidence Q) : QuotientVarietyClosed Q :=
  And.intro E.actionRegularClosed (And.intro E.quotientPropertyClosed E.categoricalQuotientPropertyClosed)

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse
