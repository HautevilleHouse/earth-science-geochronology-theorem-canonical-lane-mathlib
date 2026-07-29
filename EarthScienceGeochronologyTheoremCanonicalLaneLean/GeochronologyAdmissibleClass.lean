import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure GeochronologyAdmittedObject where
  sampleAge : ℝ
  isotopicSystem : String
  closureTemperature : ℝ
  decayConstant : ℝ
  ageConsistency : Prop

structure GeochronologyEndgameState where
  object : GeochronologyAdmittedObject

def GeochronologyWitnessClosed (O : GeochronologyAdmittedObject) : Prop :=
  O.ageConsistency

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse
