import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure DecayConstantPackage where
  isotope : String
  halfLife : ℝ
  decayConstant : ℝ
  decayConstantPositive : decayConstant > 0
  halfLifeConsistent : decayConstant = Real.log 2 / halfLife

structure DecayConstantEvidence (D : DecayConstantPackage) where
  decayConstantPositiveClosed : D.decayConstantPositive
  halfLifeConsistentClosed : D.halfLifeConsistent

def DecayConstantClosed (D : DecayConstantPackage) : Prop :=
  D.decayConstantPositive ∧ D.halfLifeConsistent

theorem decay_constant_closed_from_evidence (D : DecayConstantPackage)
    (E : DecayConstantEvidence D) : DecayConstantClosed D := by
  exact And.intro E.decayConstantPositiveClosed E.halfLifeConsistentClosed

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse