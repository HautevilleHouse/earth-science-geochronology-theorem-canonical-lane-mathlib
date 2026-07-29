import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure DecayConstantPackage where
  isotope : Type
  halfLife : Prop
  decayConstant : Prop
  precisionBound : Prop

def DecayConstantClosed (D : DecayConstantPackage) : Prop :=
  D.halfLife ∧ D.decayConstant ∧ D.precisionBound

structure DecayConstantEvidence (D : DecayConstantPackage) where
  halfLifeClosed : D.halfLife
  decayConstantClosed : D.decayConstant
  precisionBoundClosed : D.precisionBound

theorem decay_constant_closed_from_evidence (D : DecayConstantPackage)
    (E : DecayConstantEvidence D) : DecayConstantClosed D := by
  exact And.intro E.halfLifeClosed (And.intro E.decayConstantClosed E.precisionBoundClosed)

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse