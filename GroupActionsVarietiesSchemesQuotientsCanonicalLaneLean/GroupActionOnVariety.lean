import GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.AdmittedObject

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure GroupActionOnVarietyPackage (O : AdmittedObject) where
  groupType : Type u
  actionDefined : Prop
  actionContinuous : Prop
  actionAlgebraic : Prop
  orbitsClassified : Prop
  stabilizerSubgroups : Prop

structure GroupActionOnVarietyEvidence (O : AdmittedObject) (G : GroupActionOnVarietyPackage O) where
  actionDefinedClosed : G.actionDefined
  actionContinuousClosed : G.actionContinuous
  actionAlgebraicClosed : G.actionAlgebraic
  orbitsClassifiedClosed : G.orbitsClassified
  stabilizerSubgroupsClosed : G.stabilizerSubgroups

def GroupActionOnVarietyClosed (O : AdmittedObject) (G : GroupActionOnVarietyPackage O) : Prop :=
  G.actionDefined ∧ G.actionContinuous ∧ G.actionAlgebraic ∧
  G.orbitsClassified ∧ G.stabilizerSubgroups

theorem group_action_on_variety_closed_from_evidence
    (O : AdmittedObject) (G : GroupActionOnVarietyPackage O)
    (E : GroupActionOnVarietyEvidence O G) : GroupActionOnVarietyClosed O G := by
  exact And.intro E.actionDefinedClosed
    (And.intro E.actionContinuousClosed
      (And.intro E.actionAlgebraicClosed
        (And.intro E.orbitsClassifiedClosed E.stabilizerSubgroupsClosed)))

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse