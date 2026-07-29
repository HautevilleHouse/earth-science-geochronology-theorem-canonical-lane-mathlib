import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeochronologyTheoremCanonicalLaneLean.UraniumLeadDating

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure IsochronRegressionPackage (U : UraniumLeadDatingPackage) where
  dataPoints : Nat
  slopeComputed : ℝ
  interceptComputed : ℝ
  mswd : ℝ
  initialRatioInferred : ℝ
  ageFromSlope : ℝ
  linearFitValid : Prop
  mswdAcceptable : Prop
  initialRatioConsistent : Prop
  ageFromSlopeConsistent : Prop

structure IsochronRegressionEvidence {U : UraniumLeadDatingPackage}
    (I : IsochronRegressionPackage U) where
  linearFitValidClosed : I.linearFitValid
  mswdAcceptableClosed : I.mswdAcceptable
  initialRatioConsistentClosed : I.initialRatioConsistent
  ageFromSlopeConsistentClosed : I.ageFromSlopeConsistent

def IsochronRegressionClosed {U : UraniumLeadDatingPackage}
    (I : IsochronRegressionPackage U) : Prop :=
  I.linearFitValid ∧ I.mswdAcceptable ∧
  I.initialRatioConsistent ∧ I.ageFromSlopeConsistent

theorem isochron_regression_closed_from_evidence {U : UraniumLeadDatingPackage}
    (I : IsochronRegressionPackage U) (E : IsochronRegressionEvidence I) :
    IsochronRegressionClosed I := by
  exact And.intro E.linearFitValidClosed
    (And.intro E.mswdAcceptableClosed
      (And.intro E.initialRatioConsistentClosed E.ageFromSlopeConsistentClosed))

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse
