import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure UraniumLeadGeochronologyPackage where
  u238InitialRatio : ℝ
  u235InitialRatio : ℝ
  pb206Accumulated : ℝ
  pb207Accumulated : ℝ
  decayConstantU238 : ℝ
  decayConstantU235 : ℝ
  concordiaAgeMismatch : Prop

structure UraniumLeadGeochronologyEvidence (G : UraniumLeadGeochronologyPackage) where
  u238InitialRatioClosed : G.u238InitialRatio > 0
  u235InitialRatioClosed : G.u235InitialRatio > 0
  pb206AccumulatedClosed : G.pb206Accumulated ≥ 0
  pb207AccumulatedClosed : G.pb207Accumulated ≥ 0
  decayConstantU238Closed : G.decayConstantU238 > 0
  decayConstantU235Closed : G.decayConstantU235 > 0
  concordiaAgeMismatchClosed : G.concordiaAgeMismatch

def UraniumLeadGeochronologyClosed (G : UraniumLeadGeochronologyPackage) : Prop :=
  G.u238InitialRatio > 0 ∧ G.u235InitialRatio > 0 ∧
  G.pb206Accumulated ≥ 0 ∧ G.pb207Accumulated ≥ 0 ∧
  G.decayConstantU238 > 0 ∧ G.decayConstantU235 > 0 ∧
  G.concordiaAgeMismatch

theorem uranium_lead_geochronology_closed_from_evidence
    (G : UraniumLeadGeochronologyPackage)
    (E : UraniumLeadGeochronologyEvidence G) :
    UraniumLeadGeochronologyClosed G := by
  exact And.intro E.u238InitialRatioClosed
    (And.intro E.u235InitialRatioClosed
      (And.intro E.pb206AccumulatedClosed
        (And.intro E.pb207AccumulatedClosed
          (And.intro E.decayConstantU238Closed
            (And.intro E.decayConstantU235Closed
              E.concordiaAgeMismatchClosed)))))

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse