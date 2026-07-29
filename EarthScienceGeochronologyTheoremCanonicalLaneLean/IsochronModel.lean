import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeochronologyTheoremCanonicalLaneLean.DecaySystem

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

/-!
# Isochron Model Package
-/

structure IsochronModelPackage (O : GeochronologyAdmittedObject) (D : DecaySystemPackage O) where
  sampleSet : Type u
  ratioParentDaughter : sampleSet → ℝ
  ratioDaughterRadiogenic : sampleSet → ℝ
  initialRatio : ℝ
  isochronSlope : ℝ
  ageEstimate : ℝ
  isochronRegression : Prop
  modelMsdw : ℝ

def isochronAge (slope : ℝ) (lambda : ℝ) : ℝ := slope / lambda

structure IsochronModelEvidence (O : GeochronologyAdmittedObject) (D : DecaySystemPackage O) (I : IsochronModelPackage O D) where
  isochronRegressionClosed : I.isochronRegression
  ageConsistencyClosed : I.ageEstimate = isochronAge I.isochronSlope D.decayConstant
  msdwWithinRange : I.modelMsdw ≤ 2.5

def IsochronModelClosed (O : GeochronologyAdmittedObject) (D : DecaySystemPackage O) (I : IsochronModelPackage O D) : Prop :=
  I.isochronRegression ∧ I.ageEstimate = isochronAge I.isochronSlope D.decayConstant ∧ I.modelMsdw ≤ 2.5

theorem isochron_model_closed_from_evidence (O : GeochronologyAdmittedObject) (D : DecaySystemPackage O) (I : IsochronModelPackage O D) (E : IsochronModelEvidence O D I) : IsochronModelClosed O D I := by
  exact And.intro E.isochronRegressionClosed (And.intro E.ageConsistencyClosed E.msdwWithinRange)

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse
