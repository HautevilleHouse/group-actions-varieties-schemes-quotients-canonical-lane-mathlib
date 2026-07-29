import GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.AdmittedObject

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure QuotientVarietySchemePackage (O : AdmittedObject) where
  quotientSpaceStructure : Prop
  varietyStructureCompatible : Prop
  schemeStructureCompatible : Prop
  quotientMapDefined : Prop
  invariantTheoryApplied : Prop

structure QuotientVarietySchemeEvidence (O : AdmittedObject) (P : QuotientVarietySchemePackage O) where
  quotientSpaceStructureClosed : P.quotientSpaceStructure
  varietyStructureCompatibleClosed : P.varietyStructureCompatible
  schemeStructureCompatibleClosed : P.schemeStructureCompatible
  quotientMapDefinedClosed : P.quotientMapDefined
  invariantTheoryAppliedClosed : P.invariantTheoryApplied

def QuotientVarietySchemeClosed (O : AdmittedObject) (P : QuotientVarietySchemePackage O) : Prop :=
  P.quotientSpaceStructure ∧ P.varietyStructureCompatible ∧
  P.schemeStructureCompatible ∧ P.quotientMapDefined ∧ P.invariantTheoryApplied

theorem quotient_variety_scheme_closed_from_evidence
    (O : AdmittedObject) (P : QuotientVarietySchemePackage O)
    (E : QuotientVarietySchemeEvidence O P) : QuotientVarietySchemeClosed O P := by
  exact And.intro E.quotientSpaceStructureClosed
    (And.intro E.varietyStructureCompatibleClosed
      (And.intro E.schemeStructureCompatibleClosed
        (And.intro E.quotientMapDefinedClosed E.invariantTheoryAppliedClosed)))

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse