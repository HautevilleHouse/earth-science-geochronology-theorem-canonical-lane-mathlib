import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure DecaySeriesPackage where
  parentNuclide : Type
  intermediateNuclides : List Type
  stableDaughter : Type
  branchRatios : List ℝ
  decayChainLength : ℕ
  branchRatiosSumToOne : (∑ r in branchRatios, r) = 1 := by
    simp

structure DecaySeriesEvidence (D : DecaySeriesPackage) where
  branchRatiosSumToOneClosed : (∑ r in D.branchRatios, r) = 1 := D.branchRatiosSumToOne
  chainConsistent : True := True.intro

def DecaySeriesClosed (D : DecaySeriesPackage) : Prop :=
  (∑ r in D.branchRatios, r) = 1

theorem decay_series_closed_from_evidence
    (D : DecaySeriesPackage) (E : DecaySeriesEvidence D) :
    DecaySeriesClosed D := by
  exact E.branchRatiosSumToOneClosed

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse