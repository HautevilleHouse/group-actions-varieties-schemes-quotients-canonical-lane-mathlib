import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure GeometricInvariantTheoryPackage where
  variety : Type u
  linearizedLineBundle : Type v
  semistablePoints : Set variety
  stablePoints : Set variety
  categoricalQuotient : SchemeQuotientPackage
  projectiveQuotient : SchemeQuotientPackage
  amplenessCondition : Prop
  hilbertMumfordCriterion : Prop

def GeometricInvariantTheoryClosed (G : GeometricInvariantTheoryPackage) : Prop :=
  G.amplenessCondition ∧ G.hilbertMumfordCriterion

theorem geometric_invariant_theory_closed_from_evidence
    (G : GeometricInvariantTheoryPackage) (hA : G.amplenessCondition) (hH : G.hilbertMumfordCriterion) :
    GeometricInvariantTheoryClosed G :=
by
  exact And.intro hA hH

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse