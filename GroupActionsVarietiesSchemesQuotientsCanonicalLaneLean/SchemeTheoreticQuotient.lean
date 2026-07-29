import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean.GeometricQuotientBridge

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure SchemeTheoreticQuotientPackage (A : AdmissibleClass) where
  schemeStructure : Type u
  quotientScheme : Type v
  quotientMorphismScheme : schemeStructure → quotientScheme
  flatness : Prop
  integralClosure : Prop

structure SchemeTheoreticQuotientEvidence {A : AdmissibleClass} (P : SchemeTheoreticQuotientPackage A) where
  flatnessClosed : P.flatness
  integralClosureClosed : P.integralClosure

def SchemeTheoreticQuotientClosed {A : AdmissibleClass} (P : SchemeTheoreticQuotientPackage A) : Prop :=
  P.flatness ∧ P.integralClosure

theorem scheme_theoretic_quotient_closed_from_evidence
    {A : AdmissibleClass} (P : SchemeTheoreticQuotientPackage A) (E : SchemeTheoreticQuotientEvidence P) :
    SchemeTheoreticQuotientClosed P := by
  exact And.intro E.flatnessClosed E.integralClosureClosed

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse
