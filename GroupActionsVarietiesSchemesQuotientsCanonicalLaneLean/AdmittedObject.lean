import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure AdmittedObject where
  groupAction : Type u
  variety : Type v
  scheme : Type w
  quotientSpace : Type x
  quotientStructure : Prop
  varietyStructure : Prop
  schemeStructure : Prop
  quotientStructureClosed : quotientStructure
  varietyStructureClosed : varietyStructure
  schemeStructureClosed : schemeStructure

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse