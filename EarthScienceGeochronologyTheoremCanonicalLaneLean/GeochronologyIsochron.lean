import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure IsochronPackage where
  measuredRatios : List (ℝ × ℝ)
  regressionSlope : ℝ
  regressionIntercept : ℝ
  isochronAge : ℝ
  mswd : ℝ
  errorEllipseAxes : ℝ × ℝ

structure IsochronEvidence (I : IsochronPackage) where
  measuredRatiosNonempty : I.measuredRatios ≠ []
  regressionSlopeClosed : I.regressionSlope ≠ 0
  isochronAgeClosed : I.isochronAge ≥ 0
  mswdClosed : I.mswd ≥ 0
  errorEllipseAxesClosed : I.errorEllipseAxes.1 ≥ 0 ∧ I.errorEllipseAxes.2 ≥ 0

def IsochronClosed (I : IsochronPackage) : Prop :=
  I.measuredRatios ≠ [] ∧ I.regressionSlope ≠ 0 ∧
  I.isochronAge ≥ 0 ∧ I.mswd ≥ 0 ∧
  I.errorEllipseAxes.1 ≥ 0 ∧ I.errorEllipseAxes.2 ≥ 0

theorem isochron_closed_from_evidence
    (I : IsochronPackage) (E : IsochronEvidence I) :
    IsochronClosed I := by
  exact And.intro E.measuredRatiosNonempty
    (And.intro E.regressionSlopeClosed
      (And.intro E.isochronAgeClosed
        (And.intro E.mswdClosed
          (And.intro E.errorEllipseAxesClosed.1 E.errorEllipseAxesClosed.2))))

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse