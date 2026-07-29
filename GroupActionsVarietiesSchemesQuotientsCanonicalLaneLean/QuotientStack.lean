import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure QuotientStackPackage where
  scheme : Type u
  groupoid : Type v
  sourceMap : groupoid → scheme
  targetMap : groupoid → scheme
  composition : groupoid → groupoid → groupoid
  identitySection : scheme → groupoid
  etaleCondition : Prop
  quotientStack : Type w
  atlas : Type u
  descentData : Prop
  representableMorphism : Prop

def QuotientStackClosed (Q : QuotientStackPackage) : Prop :=
  Q.etaleCondition ∧ Q.descentData ∧ Q.representableMorphism

theorem quotient_stack_closed_from_evidence (Q : QuotientStackPackage)
    (hE : Q.etaleCondition) (hD : Q.descentData) (hR : Q.representableMorphism) :
    QuotientStackClosed Q :=
by
  exact And.intro hE (And.intro hD hR)

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse