import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  (A.object.decayConstantKnown ∧ A.object.initialRatioKnown ∧ A.object.measuredRatio)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse