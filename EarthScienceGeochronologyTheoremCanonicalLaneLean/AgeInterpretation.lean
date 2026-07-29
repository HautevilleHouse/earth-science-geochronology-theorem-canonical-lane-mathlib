import canonicalLaneMathlib.AdmissibleClass
import EarthScienceGeochronologyTheoremCanonicalLaneLean.IsochronRegression

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure AgeInterpretationPackage {D : DecayConstantPackage}
    (I : IsochronRegressionPackage D) where
  calculatedAge : Prop
  uncertaintyRange : Prop
  geologicContextConsistency : Prop
  closureTemperatureAssumption : Prop

def AgeInterpretationClosed {D : DecayConstantPackage}
    (I : IsochronRegressionPackage D) (A : AgeInterpretationPackage I) : Prop :=
  A.calculatedAge ∧ A.uncertaintyRange ∧ A.geologicContextConsistency ∧ A.closureTemperatureAssumption

structure AgeInterpretationEvidence {D : DecayConstantPackage}
    (I : IsochronRegressionPackage D) (A : AgeInterpretationPackage I) where
  calculatedAgeClosed : A.calculatedAge
  uncertaintyRangeClosed : A.uncertaintyRange
  geologicContextConsistencyClosed : A.geologicContextConsistency
  closureTemperatureAssumptionClosed : A.closureTemperatureAssumption

theorem age_interpretation_closed_from_evidence {D : DecayConstantPackage}
    (I : IsochronRegressionPackage D) (A : AgeInterpretationPackage I)
    (E : AgeInterpretationEvidence I A) : AgeInterpretationClosed I A := by
  exact And.intro E.calculatedAgeClosed (And.intro E.uncertaintyRangeClosed
    (And.intro E.geologicContextConsistencyClosed E.closureTemperatureAssumptionClosed))

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse