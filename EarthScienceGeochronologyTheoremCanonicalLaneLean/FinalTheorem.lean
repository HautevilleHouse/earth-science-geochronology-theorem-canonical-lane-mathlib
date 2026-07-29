import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeochronologyTheoremCanonicalLaneLean.ConcordiaDiscordia

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

def ConstrainedGeochronologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_geochronology_endgame (A : AdmissibleClass) :
    ConstrainedGeochronologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse
