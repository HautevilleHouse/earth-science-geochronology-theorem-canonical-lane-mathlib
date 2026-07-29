import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure AgeInterpretationPackage where
  decayConstant : ℝ
  slopeFromRegression : ℝ
  initialRatio : ℝ
  measuredRatio : ℝ
  ageComputed : ℝ
  ageFormula : ageComputed = Real.log (1 + (measuredRatio - initialRatio) / initialRatio) / decayConstant
  agePositive : ageComputed > 0

structure AgeInterpretationEvidence (A : AgeInterpretationPackage) where
  ageFormulaClosed : A.ageFormula
  agePositiveClosed : A.agePositive

def AgeInterpretationClosed (A : AgeInterpretationPackage) : Prop :=
  A.ageFormula ∧ A.agePositive

theorem age_interpretation_closed_from_evidence (A : AgeInterpretationPackage)
    (E : AgeInterpretationEvidence A) : AgeInterpretationClosed A := by
  exact And.intro E.ageFormulaClosed E.agePositiveClosed

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse