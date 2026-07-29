import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure ClosureAgeEndpointPackage (R : RadiometricDatingPackage) (I : IsochronRegressionPackage) (D : DecaySeriesPackage) where
  calculatedAge : ℝ
  uncertainty : ℝ
  closureTemperature : ℝ
  ageConsistentWithGeology : Prop
  closureTemperaturePositive : closureTemperature > 0 := by norm_num

structure ClosureAgeEndpointEvidence {R : RadiometricDatingPackage} {I : IsochronRegressionPackage} {D : DecaySeriesPackage} (C : ClosureAgeEndpointPackage R I D) where
  ageConsistentWithGeologyClosed : C.ageConsistentWithGeology
  uncertaintyBounded : C.uncertainty < C.calculatedAge / 10 := by
    nlinarith [C.closureTemperaturePositive]

def ClosureAgeEndpointClosed {R : RadiometricDatingPackage} {I : IsochronRegressionPackage} {D : DecaySeriesPackage} (C : ClosureAgeEndpointPackage R I D) : Prop :=
  C.ageConsistentWithGeology ∧ C.uncertainty < C.calculatedAge / 10

theorem closure_age_endpoint_closed_from_evidence
    {R : RadiometricDatingPackage} {I : IsochronRegressionPackage} {D : DecaySeriesPackage}
    (C : ClosureAgeEndpointPackage R I D) (E : ClosureAgeEndpointEvidence C) :
    ClosureAgeEndpointClosed C := by
  exact And.intro E.ageConsistentWithGeologyClosed E.uncertaintyBounded

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse