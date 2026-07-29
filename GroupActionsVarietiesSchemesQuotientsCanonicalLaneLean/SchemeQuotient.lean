import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure SchemeQuotientPackage where
  scheme : Type u
  groupAction : GroupActionVarietyPackage
  quotient : Type v
  projection : scheme → quotient
  quotientTopology : TopologicalSpace quotient
  quotientSheaf : Type w
  universalProperty : Prop
  categoricalQuotient : Prop
  goodQuotient : Prop

theorem scheme_quotient_projection_surjective
    (P : SchemeQuotientPackage) : Function.Surjective P.projection :=
by
  intro q
  sorry

def SchemeQuotientClosed (P : SchemeQuotientPackage) : Prop :=
  P.universalProperty ∧ P.categoricalQuotient ∧ P.goodQuotient

theorem scheme_quotient_closed_from_evidence (P : SchemeQuotientPackage)
    (hU : P.universalProperty) (hC : P.categoricalQuotient) (hG : P.goodQuotient) :
    SchemeQuotientClosed P :=
by
  exact And.intro hU (And.intro hC hG)

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse