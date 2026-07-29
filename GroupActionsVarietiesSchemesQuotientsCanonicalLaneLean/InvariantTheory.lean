import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure InvariantTheory where
  groupRepresentation : Type u → Type v
  invariantRing : Type w
  hilbertSeries : ℕ → ℕ
  reductiveGroup : Prop
  finitelyGenerated : Prop
  separationProperty : Prop

structure InvariantTheoryEvidence (I : InvariantTheory) where
  reductiveGroupClosed : I.reductiveGroup
  finitelyGeneratedClosed : I.finitelyGenerated
  separationPropertyClosed : I.separationProperty

def InvariantTheoryClosed (I : InvariantTheory) : Prop :=
  I.reductiveGroup ∧ I.finitelyGenerated ∧ I.separationProperty

theorem invariant_theory_closed_from_evidence
    (I : InvariantTheory) (E : InvariantTheoryEvidence I) :
    InvariantTheoryClosed I := by
  exact And.intro E.reductiveGroupClosed
    (And.intro E.finitelyGeneratedClosed E.separationPropertyClosed)

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse