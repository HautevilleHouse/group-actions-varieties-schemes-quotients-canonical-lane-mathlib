import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure GroupActionVarietyPackage where
  group : Type u
  variety : Type v
  actingOn : group → variety → variety
  groupIdentity : ∀ x : variety, actingOn (1 : group) x = x
  groupCompatibility : ∀ (g h : group) (x : variety), actingOn (g * h) x = actingOn g (actingOn h x)
  continuousAction : Prop
  rationalAction : Prop
  orbits : Type w
  quotientSheaf : Type z
  orbitSpace : Type w

structure GroupActionVarietyEvidence (P : GroupActionVarietyPackage) where
  identityClosed : P.groupIdentity = P.groupIdentity
  compatibilityClosed : P.groupCompatibility = P.groupCompatibility
  continuousClosed : P.continuousAction
  rationalClosed : P.rationalAction

def GroupActionVarietyClosed (P : GroupActionVarietyPackage) : Prop :=
  P.continuousAction ∧ P.rationalAction

theorem group_action_variety_closed_from_evidence
    (P : GroupActionVarietyPackage) (E : GroupActionVarietyEvidence P) :
    GroupActionVarietyClosed P :=
by
  exact And.intro E.continuousClosed E.rationalClosed

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse