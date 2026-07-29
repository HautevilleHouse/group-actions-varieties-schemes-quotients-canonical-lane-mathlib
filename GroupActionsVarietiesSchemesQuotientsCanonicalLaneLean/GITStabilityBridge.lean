import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.SchemeTheoreticQuotient

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure GITStabilityBridgePackage (A : AdmissibleClass) where
  semistableCondition : Prop
  stableCondition : Prop
  categoricalQuotient : Prop
  goodQuotient : Prop
  orbitClosureRelation : Prop

structure GITStabilityBridgeEvidence {A : AdmissibleClass} (P : GITStabilityBridgePackage A) where
  semistableConditionClosed : P.semistableCondition
  stableConditionClosed : P.stableCondition
  categoricalQuotientClosed : P.categoricalQuotient
  goodQuotientClosed : P.goodQuotient
  orbitClosureRelationClosed : P.orbitClosureRelation

def GITStabilityBridgeClosed {A : AdmissibleClass} (P : GITStabilityBridgePackage A) : Prop :=
  P.semistableCondition ∧ P.stableCondition ∧ P.categoricalQuotient ∧ P.goodQuotient ∧ P.orbitClosureRelation

theorem git_stability_bridge_closed_from_evidence
    {A : AdmissibleClass} (P : GITStabilityBridgePackage A) (E : GITStabilityBridgeEvidence P) :
    GITStabilityBridgeClosed P := by
  exact And.intro E.semistableConditionClosed (And.intro E.stableConditionClosed
    (And.intro E.categoricalQuotientClosed (And.intro E.goodQuotientClosed E.orbitClosureRelationClosed)))

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse
