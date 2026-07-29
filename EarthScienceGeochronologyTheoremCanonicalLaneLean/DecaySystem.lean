import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeochronologyTheoremCanonicalLaneLean.GeochronologyAdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

/-!
# Isotopic Decay System Package
-/

structure DecaySystemPackage (O : GeochronologyAdmittedObject) where
  parentIsotope : String
  daughterIsotope : String
  decayConstant : ℝ
  initialRatio : ℝ
  halfLife : ℝ
  decayEquation : Prop
  closureTemperature : ℝ

def decayConstantFromHalfLife (hl : ℝ) : ℝ := Real.log 2 / hl

structure DecaySystemEvidence (O : GeochronologyAdmittedObject) (D : DecaySystemPackage O) where
  decayEquationClosed : D.decayEquation
  halfLifeConsistent : D.halfLife > 0
  decayConstantMatch : D.decayConstant = decayConstantFromHalfLife D.halfLife

def DecaySystemClosed (O : GeochronologyAdmittedObject) (D : DecaySystemPackage O) : Prop :=
  D.decayEquation ∧ D.halfLife > 0 ∧ D.decayConstant = decayConstantFromHalfLife D.halfLife

theorem decay_system_closed_from_evidence (O : GeochronologyAdmittedObject) (D : DecaySystemPackage O) (E : DecaySystemEvidence O D) : DecaySystemClosed O D := by
  exact And.intro E.decayEquationClosed (And.intro E.halfLifeConsistent E.decayConstantMatch)

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse
