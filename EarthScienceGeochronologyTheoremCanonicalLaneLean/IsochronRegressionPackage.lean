import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure IsochronRegressionPackage where
  parentIsotope : String
  daughterIsotope : String
  dataPoints : Nat
  slopeCalculated : ℝ
  interceptCalculated : ℝ
  slopePositive : slopeCalculated > 0
  mswdComputed : ℝ
  fitValid : mswdComputed < 10

structure IsochronRegressionEvidence (I : IsochronRegressionPackage) where
  slopePositiveClosed : I.slopePositive
  fitValidClosed : I.fitValid

def IsochronRegressionClosed (I : IsochronRegressionPackage) : Prop :=
  I.slopePositive ∧ I.fitValid

theorem isochron_regression_closed_from_evidence (I : IsochronRegressionPackage)
    (E : IsochronRegressionEvidence I) : IsochronRegressionClosed I := by
  exact And.intro E.slopePositiveClosed E.fitValidClosed

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse