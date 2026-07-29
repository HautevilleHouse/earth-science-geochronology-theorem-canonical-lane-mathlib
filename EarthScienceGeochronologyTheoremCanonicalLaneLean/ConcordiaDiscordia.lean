import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeochronologyTheoremCanonicalLaneLean.UraniumLeadDating

namespace HautevilleHouse
namespace EarthScienceGeochronologyTheoremCanonicalLaneLean

structure ConcordiaDiscordiaPackage (U : UraniumLeadDatingPackage) where
  concordiaAge : ℝ
  discordiaIntercept : ℝ
  lowerInterceptAge : ℝ
  upperInterceptAge : ℝ
  concordantPoint : Prop
  discordiaLineFit : Prop
  ageInterpretationConsistent : Prop

structure ConcordiaDiscordiaEvidence {U : UraniumLeadDatingPackage}
    (C : ConcordiaDiscordiaPackage U) where
  concordantPointClosed : C.concordantPoint
  discordiaLineFitClosed : C.discordiaLineFit
  ageInterpretationConsistentClosed : C.ageInterpretationConsistent

def ConcordiaDiscordiaClosed {U : UraniumLeadDatingPackage}
    (C : ConcordiaDiscordiaPackage U) : Prop :=
  C.concordantPoint ∧ C.discordiaLineFit ∧ C.ageInterpretationConsistent

theorem concordia_discordia_closed_from_evidence {U : UraniumLeadDatingPackage}
    (C : ConcordiaDiscordiaPackage U) (E : ConcordiaDiscordiaEvidence C) :
    ConcordiaDiscordiaClosed C := by
  exact And.intro E.concordantPointClosed
    (And.intro E.discordiaLineFitClosed E.ageInterpretationConsistentClosed)

end EarthScienceGeochronologyTheoremCanonicalLaneLean
end HautevilleHouse
