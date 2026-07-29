import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeochronologyTheoremCanonicalLaneLean.GeochronologyAdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

/-!
# Thermal History Package
-/

structure ThermalHistoryPackage (O : GeochronologyAdmittedObject) where
  coolingRate : ℝ
  closureTemperature : ℝ
  diffusionDomainSize : ℝ
  activationEnergy : ℝ
  dodsonModel : Prop
  closureTemperatureCalculated : Prop

def dodsonClosureTemperature (Ea : ℝ) (D0 : ℝ) (a : ℝ) (dTdt : ℝ) : ℝ :=
  (Ea / (Real.log (Real.log (D0 / a ^ 2)))) * (dTdt ^ (-1))

structure ThermalHistoryEvidence (O : GeochronologyAdmittedObject) (T : ThermalHistoryPackage O) where
  dodsonModelClosed : T.dodsonModel
  closureTemperatureCalculatedClosed : T.closureTemperatureCalculated

  (
    -- For simplicity, we assume the closure temperature calculation is compatible
  )

def ThermalHistoryClosed (O : GeochronologyAdmittedObject) (T : ThermalHistoryPackage O) : Prop :=
  T.dodsonModel ∧ T.closureTemperatureCalculated

theorem thermal_history_closed_from_evidence (O : GeochronologyAdmittedObject) (T : ThermalHistoryPackage O) (E : ThermalHistoryEvidence O T) : ThermalHistoryClosed O T := by
  exact And.intro E.dodsonModelClosed E.closureTemperatureCalculatedClosed

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse
