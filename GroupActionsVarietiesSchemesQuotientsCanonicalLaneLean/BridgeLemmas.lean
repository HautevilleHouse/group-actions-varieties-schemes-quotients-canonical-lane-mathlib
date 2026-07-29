import GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.quotientStructure ∧ A.object.varietyStructure ∧ A.object.schemeStructure

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.quotientStructureClosed
    (And.intro A.object.varietyStructureClosed A.object.schemeStructureClosed)

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse