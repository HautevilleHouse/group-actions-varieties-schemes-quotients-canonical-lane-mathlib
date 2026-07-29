import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure InvariantRingPackage where
  ring : Type u
  groupAction : GroupActionVarietyPackage
  invariants : Subring ring
  inclusion : invariants → ring
  hilbertSeries : Type v
  finiteGeneration : Prop
  reynoldsOperator : Type w
  seperation : Prop

def InvariantRingClosed (I : InvariantRingPackage) : Prop :=
  I.finiteGeneration ∧ I.seperation

theorem invariant_ring_closed_from_evidence (I : InvariantRingPackage)
    (hF : I.finiteGeneration) (hS : I.seperation) :
    InvariantRingClosed I :=
by
  exact And.intro hF hS

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse