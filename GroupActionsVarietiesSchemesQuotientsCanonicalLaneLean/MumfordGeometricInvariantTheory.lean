import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.SchemeQuotient

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure MumfordGITPackage {G : GroupActionVarietyPackage}
    {Q : CategoricalQuotientPackage G} {S : SchemeQuotientPackage G Q} where
  linearization : Type u
  semistablePoints : Set G.variety
  stablePoints : Set G.variety
  categoricalQuotientIsGood : Prop
  linearizationData : Prop
  semistablePointsOpen : Prop
  stablePointsNonempty : Prop
  categoricalQuotientIsGoodTerm : categoricalQuotientIsGood
  linearizationDataTerm : linearizationData
  semistablePointsOpenTerm : semistablePointsOpen
  stablePointsNonemptyTerm : stablePointsNonempty

structure MumfordGITEvidence {G : GroupActionVarietyPackage}
    {Q : CategoricalQuotientPackage G} {S : SchemeQuotientPackage G Q}
    (M : MumfordGITPackage G Q S) where
  categoricalQuotientIsGoodClosed : M.categoricalQuotientIsGood
  linearizationDataClosed : M.linearizationData
  semistablePointsOpenClosed : M.semistablePointsOpen
  stablePointsNonemptyClosed : M.stablePointsNonempty

def MumfordGITClosed {G : GroupActionVarietyPackage}
    {Q : CategoricalQuotientPackage G} {S : SchemeQuotientPackage G Q}
    (M : MumfordGITPackage G Q S) : Prop :=
  M.categoricalQuotientIsGood ∧ M.linearizationData ∧
  M.semistablePointsOpen ∧ M.stablePointsNonempty

theorem mumford_git_closed_from_evidence
    {G : GroupActionVarietyPackage} {Q : CategoricalQuotientPackage G}
    {S : SchemeQuotientPackage G Q} (M : MumfordGITPackage G Q S)
    (E : MumfordGITEvidence M) : MumfordGITClosed M := by
  exact And.intro E.categoricalQuotientIsGoodClosed
    (And.intro E.linearizationDataClosed
      (And.intro E.semistablePointsOpenClosed E.stablePointsNonemptyClosed))

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse