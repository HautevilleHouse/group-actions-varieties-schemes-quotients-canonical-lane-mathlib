import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure QuotientStackStructure where
  schemeBase : Type u
  groupoidSourceTarget : Type v → Type v
  nerveSimplicial : Prop
  quotientStack : Type w
  representableMorphism : Prop
  coarseModuliSpace : Prop

structure QuotientStackStructureEvidence (Q : QuotientStackStructure) where
  nerveSimplicialClosed : Q.nerveSimplicial
  representableMorphismClosed : Q.representableMorphism
  coarseModuliSpaceClosed : Q.coarseModuliSpace

def QuotientStackStructureClosed (Q : QuotientStackStructure) : Prop :=
  Q.nerveSimplicial ∧ Q.representableMorphism ∧ Q.coarseModuliSpace

theorem quotient_stack_structure_closed_from_evidence
    (Q : QuotientStackStructure) (E : QuotientStackStructureEvidence Q) :
    QuotientStackStructureClosed Q := by
  exact And.intro E.nerveSimplicialClosed
    (And.intro E.representableMorphismClosed E.coarseModuliSpaceClosed)

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse