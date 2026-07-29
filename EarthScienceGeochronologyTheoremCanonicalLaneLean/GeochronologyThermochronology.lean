import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure ThermochronologyPackage where
  closureTemperature : ℝ
  coolingRate : ℝ
  diffusionActivationEnergy : ℝ
  effectiveDiffusionRadius : ℝ
  daughterRetentionFraction : ℝ

structure ThermochronologyEvidence (T : ThermochronologyPackage) where
  closureTemperatureClosed : T.closureTemperature > 0
  coolingRateClosed : T.coolingRate > 0
  diffusionActivationEnergyClosed : T.diffusionActivationEnergy > 0
  effectiveDiffusionRadiusClosed : T.effectiveDiffusionRadius > 0
  daughterRetentionFractionClosed : 0 ≤ T.daughterRetentionFraction ∧ T.daughterRetentionFraction ≤ 1

def ThermochronologyClosed (T : ThermochronologyPackage) : Prop :=
  T.closureTemperature > 0 ∧ T.coolingRate > 0 ∧
  T.diffusionActivationEnergy > 0 ∧ T.effectiveDiffusionRadius > 0 ∧
  0 ≤ T.daughterRetentionFraction ∧ T.daughterRetentionFraction ≤ 1

theorem thermochronology_closed_from_evidence
    (T : ThermochronologyPackage) (E : ThermochronologyEvidence T) :
    ThermochronologyClosed T := by
  exact And.intro E.closureTemperatureClosed
    (And.intro E.coolingRateClosed
      (And.intro E.diffusionActivationEnergyClosed
        (And.intro E.effectiveDiffusionRadiusClosed
          (And.intro E.daughterRetentionFractionClosed.1
            E.daughterRetentionFractionClosed.2))))

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse