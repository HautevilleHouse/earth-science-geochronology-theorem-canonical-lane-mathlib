import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure RadiometricDatingPackage where
  parentIsotope : Type
  daughterIsotope : Type
  decayConstant : ℝ
  halfLife : ℝ
  measurementAccuracy : Prop
  contaminationBound : Prop
  initialConditionKnown : Prop
  decayConstantPositive : decayConstant > 0 := by norm_num
  halfLifePositive : halfLife > 0 := by norm_num

structure RadiometricDatingEvidence (R : RadiometricDatingPackage) where
  measurementAccuracyClosed : R.measurementAccuracy
  contaminationBoundClosed : R.contaminationBound
  initialConditionKnownClosed : R.initialConditionKnown

def RadiometricDatingClosed (R : RadiometricDatingPackage) : Prop :=
  R.measurementAccuracy ∧ R.contaminationBound ∧ R.initialConditionKnown

theorem radiometric_dating_closed_from_evidence
    (R : RadiometricDatingPackage) (E : RadiometricDatingEvidence R) :
    RadiometricDatingClosed R := by
  exact And.intro E.measurementAccuracyClosed (And.intro E.contaminationBoundClosed E.initialConditionKnownClosed)

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse