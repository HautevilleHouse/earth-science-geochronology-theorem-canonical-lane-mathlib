import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure UraniumLeadDatingPackage where
  parentIsotope : Type u
  daughterIsotope : Type v
  decayConstant : ℝ
  initialRatio : ℝ
  measuredRatio : ℝ
  ageComputed : ℝ
  closedSystemCondition : Prop
  decayConstantVerified : Prop
  initialRatioKnown : Prop
  measuredRatioPrecise : Prop
  ageFormulaConsistent : Prop

structure UraniumLeadDatingEvidence (U : UraniumLeadDatingPackage) where
  closedSystemConditionClosed : U.closedSystemCondition
  decayConstantVerifiedClosed : U.decayConstantVerified
  initialRatioKnownClosed : U.initialRatioKnown
  measuredRatioPreciseClosed : U.measuredRatioPrecise
  ageFormulaConsistentClosed : U.ageFormulaConsistent

def UraniumLeadDatingClosed (U : UraniumLeadDatingPackage) : Prop :=
  U.closedSystemCondition ∧ U.decayConstantVerified ∧
  U.initialRatioKnown ∧ U.measuredRatioPrecise ∧ U.ageFormulaConsistent

theorem uranium_lead_dating_closed_from_evidence (U : UraniumLeadDatingPackage)
    (E : UraniumLeadDatingEvidence U) : UraniumLeadDatingClosed U := by
  exact And.intro E.closedSystemConditionClosed
    (And.intro E.decayConstantVerifiedClosed
      (And.intro E.initialRatioKnownClosed
        (And.intro E.measuredRatioPreciseClosed E.ageFormulaConsistentClosed)))

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse
