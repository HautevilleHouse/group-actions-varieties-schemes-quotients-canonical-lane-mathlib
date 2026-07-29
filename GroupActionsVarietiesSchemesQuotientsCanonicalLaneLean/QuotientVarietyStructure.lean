import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.GroupActionBridge

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure QuotientVarietyPackage (A : AdmissibleClass) where
  groupAction : Prop
  varietyScheme : Prop
  quotientExists : Prop
  quotientProperties : List Prop

structure QuotientVarietyEvidence {A : AdmissibleClass} (P : QuotientVarietyPackage A) where
  groupActionClosed : P.groupAction
  varietySchemeClosed : P.varietyScheme
  quotientExistsClosed : P.quotientExists
  quotientPropertiesClosed : P.quotientProperties

def QuotientVarietyClosed {A : AdmissibleClass} (P : QuotientVarietyPackage A) : Prop :=
  P.groupAction ∧ P.varietyScheme ∧ P.quotientExists ∧ (∀ p ∈ P.quotientProperties, p)

theorem quotient_variety_closed_from_evidence
    {A : AdmissibleClass} (P : QuotientVarietyPackage A) (E : QuotientVarietyEvidence P) :
    QuotientVarietyClosed P := by
  refine And.intro E.groupActionClosed (And.intro E.varietySchemeClosed
    (And.intro E.quotientExistsClosed ?_))
  intro h
  exact E.quotientPropertiesClosed h

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse
