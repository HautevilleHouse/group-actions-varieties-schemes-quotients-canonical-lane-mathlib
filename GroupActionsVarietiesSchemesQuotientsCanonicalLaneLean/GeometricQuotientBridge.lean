import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.OrbitSpaceClassification

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure GeometricQuotientBridgePackage (A : AdmissibleClass) where
  geometricQuotient : Prop
  orbitSpaceSmooth : Prop
  quotientMorphism : Prop
  universalProperty : Prop

structure GeometricQuotientBridgeEvidence {A : AdmissibleClass} (P : GeometricQuotientBridgePackage A) where
  geometricQuotientClosed : P.geometricQuotient
  orbitSpaceSmoothClosed : P.orbitSpaceSmooth
  quotientMorphismClosed : P.quotientMorphism
  universalPropertyClosed : P.universalProperty

def GeometricQuotientBridgeClosed {A : AdmissibleClass} (P : GeometricQuotientBridgePackage A) : Prop :=
  P.geometricQuotient ∧ P.orbitSpaceSmooth ∧ P.quotientMorphism ∧ P.universalProperty

theorem geometric_quotient_bridge_closed_from_evidence
    {A : AdmissibleClass} (P : GeometricQuotientBridgePackage A) (E : GeometricQuotientBridgeEvidence P) :
    GeometricQuotientBridgeClosed P := by
  exact And.intro E.geometricQuotientClosed (And.intro E.orbitSpaceSmoothClosed
    (And.intro E.quotientMorphismClosed E.universalPropertyClosed))

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse
