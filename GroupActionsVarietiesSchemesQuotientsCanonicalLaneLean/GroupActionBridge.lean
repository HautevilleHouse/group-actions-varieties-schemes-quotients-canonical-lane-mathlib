import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

def groupActionBridge (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem group_action_bridge_closed (A : AdmissibleClass) :
    groupActionBridge A := by
  exact A.object.conclusion

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse
