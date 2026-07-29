import GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.QuotientVarietyScheme

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure GITQuotientPackage (O : AdmittedObject) (P : QuotientVarietySchemePackage O) where
  linearizationChosen : Prop
  semistableCondition : Prop
  categoricalQuotientConstructed : Prop
  goodQuotientProperties : Prop
  moduliInterpretation : Prop

structure GITQuotientEvidence (O : AdmittedObject) (P : QuotientVarietySchemePackage O)
    (Q : GITQuotientPackage O P) where
  linearizationChosenClosed : Q.linearizationChosen
  semistableConditionClosed : Q.semistableCondition
  categoricalQuotientConstructedClosed : Q.categoricalQuotientConstructed
  goodQuotientPropertiesClosed : Q.goodQuotientProperties
  moduliInterpretationClosed : Q.moduliInterpretation

def GITQuotientClosed (O : AdmittedObject) (P : QuotientVarietySchemePackage O)
    (Q : GITQuotientPackage O P) : Prop :=
  Q.linearizationChosen ∧ Q.semistableCondition ∧
  Q.categoricalQuotientConstructed ∧ Q.goodQuotientProperties ∧
  Q.moduliInterpretation

theorem git_quotient_closed_from_evidence
    (O : AdmittedObject) (P : QuotientVarietySchemePackage O)
    (Q : GITQuotientPackage O P) (E : GITQuotientEvidence O P Q) :
    GITQuotientClosed O P Q := by
  exact And.intro E.linearizationChosenClosed
    (And.intro E.semistableConditionClosed
      (And.intro E.categoricalQuotientConstructedClosed
        (And.intro E.goodQuotientPropertiesClosed E.moduliInterpretationClosed)))

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse