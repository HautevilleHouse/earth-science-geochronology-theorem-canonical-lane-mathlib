import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeochronologyTheoremCanonicalLaneLean.GeochronologyAdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GeochronologyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse
