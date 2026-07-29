import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.QuotientVarietyStructure

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure OrbitSpaceClassificationPackage (A : AdmissibleClass) where
  varietyType : Type u
  orbitSpace : Type v
  orbitMap : varietyType → orbitSpace
  classificationProperty : Prop

structure OrbitSpaceClassificationEvidence (P : OrbitSpaceClassificationPackage A) where
  orbitMapClosed : Function.Surjective P.orbitMap
  classificationPropertyClosed : P.classificationProperty

def OrbitSpaceClassificationClosed (P : OrbitSpaceClassificationPackage A) : Prop :=
  Function.Surjective P.orbitMap ∧ P.classificationProperty

theorem orbit_space_classification_closed_from_evidence
    (P : OrbitSpaceClassificationPackage A) (E : OrbitSpaceClassificationEvidence P) :
    OrbitSpaceClassificationClosed P := by
  exact And.intro E.orbitMapClosed E.classificationPropertyClosed

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse
