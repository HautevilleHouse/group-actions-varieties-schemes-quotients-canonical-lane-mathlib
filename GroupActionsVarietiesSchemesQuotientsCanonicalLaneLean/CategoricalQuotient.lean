import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.GroupActionVariety

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure CategoricalQuotientPackage {G : GroupActionVarietyPackage} where
  quotientSpace : Type w
  quotientTopology : TopologicalSpace quotientSpace
  quotientMap : G.variety → quotientSpace
  quotientUniversalProperty : Prop
  quotientMapContinuous : Prop
  quotientUniversalPropertyTerm : quotientUniversalProperty
  quotientMapContinuousTerm : quotientMapContinuous

structure CategoricalQuotientEvidence {G : GroupActionVarietyPackage}
    (Q : CategoricalQuotientPackage G) where
  quotientUniversalPropertyClosed : Q.quotientUniversalProperty
  quotientMapContinuousClosed : Q.quotientMapContinuous

def CategoricalQuotientClosed {G : GroupActionVarietyPackage}
    (Q : CategoricalQuotientPackage G) : Prop :=
  Q.quotientUniversalProperty ∧ Q.quotientMapContinuous

theorem categorical_quotient_closed_from_evidence
    {G : GroupActionVarietyPackage} (Q : CategoricalQuotientPackage G)
    (E : CategoricalQuotientEvidence Q) : CategoricalQuotientClosed Q := by
  exact And.intro E.quotientUniversalPropertyClosed E.quotientMapContinuousClosed

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse