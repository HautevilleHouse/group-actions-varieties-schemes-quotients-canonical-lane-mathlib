import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure ModuliSpace where
  baseScheme : Type u
  familyOfObjects : Type v → Type w
  periodMap : Type x
  coarseModuliSpace : Type y
  representable : Prop
  universality : Prop
  wellDefinedness : Prop

structure ModuliSpaceEvidence (M : ModuliSpace) where
  representableClosed : M.representable
  universalityClosed : M.universality
  wellDefinednessClosed : M.wellDefinedness

def ModuliSpaceClosed (M : ModuliSpace) : Prop :=
  M.representable ∧ M.universality ∧ M.wellDefinedness

theorem moduli_space_closed_from_evidence
    (M : ModuliSpace) (E : ModuliSpaceEvidence M) :
    ModuliSpaceClosed M := by
  exact And.intro E.representableClosed
    (And.intro E.universalityClosed E.wellDefinednessClosed)

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse