import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure MumfordsDescent where
  quotientStack : Type u
  etaleLocalData : Type v
  descentConditions : Prop
  effectiveDescent : Prop
  coarseModuliSpace : Prop
  finitePresentation : Prop

structure MumfordsDescentEvidence (M : MumfordsDescent) where
  descentConditionsClosed : M.descentConditions
  effectiveDescentClosed : M.effectiveDescent
  coarseModuliSpaceClosed : M.coarseModuliSpace
  finitePresentationClosed : M.finitePresentation

def MumfordsDescentClosed (M : MumfordsDescent) : Prop :=
  M.descentConditions ∧ M.effectiveDescent ∧ M.coarseModuliSpace ∧ M.finitePresentation

theorem mumfords_descent_closed_from_evidence
    (M : MumfordsDescent) (E : MumfordsDescentEvidence M) :
    MumfordsDescentClosed M := by
  exact And.intro E.descentConditionsClosed
    (And.intro E.effectiveDescentClosed
      (And.intro E.coarseModuliSpaceClosed E.finitePresentationClosed))

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse