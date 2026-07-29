import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure IsotopeSystemPackage where
  parentIsotopeHalfLife : ℝ
  daughterIsotopeAccumulation : ℝ
  closedSystemCondition : Prop
  initialDaughterRatio : ℝ
  decayConstant : ℝ
  ageEstimate : ℝ

structure IsotopeSystemEvidence (I : IsotopeSystemPackage) where
  parentIsotopeHalfLifeClosed : I.parentIsotopeHalfLife > 0
  daughterIsotopeAccumulationClosed : I.daughterIsotopeAccumulation ≥ 0
  closedSystemConditionClosed : I.closedSystemCondition
  initialDaughterRatioClosed : I.initialDaughterRatio ≥ 0
  decayConstantClosed : I.decayConstant > 0
  ageEstimateClosed : I.ageEstimate ≥ 0

def IsotopeSystemClosed (I : IsotopeSystemPackage) : Prop :=
  I.parentIsotopeHalfLife > 0 ∧ I.daughterIsotopeAccumulation ≥ 0 ∧
  I.closedSystemCondition ∧ I.initialDaughterRatio ≥ 0 ∧
  I.decayConstant > 0 ∧ I.ageEstimate ≥ 0

theorem isotope_system_closed_from_evidence
    (I : IsotopeSystemPackage) (E : IsotopeSystemEvidence I) :
    IsotopeSystemClosed I := by
  exact And.intro E.parentIsotopeHalfLifeClosed
    (And.intro E.daughterIsotopeAccumulationClosed
      (And.intro E.closedSystemConditionClosed
        (And.intro E.initialDaughterRatioClosed
          (And.intro E.decayConstantClosed E.ageEstimateClosed))))

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse