import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean

structure GroupActionOnVariety {G : Type u} [AlgebraicGroup G] {V : Type v} [Variety V] where
  action : G → V → V
  isRegular : ∀ g, IsRegular (λ x : V => action g x)
  isMorphism : ∀ g, IsMorphismV (λ x : V => action g x)

structure Orbit {G : Type u} [AlgebraicGroup G] {V : Type v} [Variety V] (act : GroupActionOnVariety G V) (x : V) where
  orbitSet : Set V
  xInOrbit : x ∈ orbitSet
  orbitClosed : IsClosed orbitSet
  orbitMap : G → V
  orbitMapImage : orbitMap '' Set.univ = orbitSet
  orbitMapContinuous : IsRegular orbitMap

structure Stabilizer {G : Type u} [AlgebraicGroup G] {V : Type v} [Variety V] (act : GroupActionOnVariety G V) (x : V) where
  stabilizerSubgroup : Subgroup G
  condition : ∀ g : G, g ∈ stabilizerSubgroup ↔ act.action g x = x
  stabilizerClosedInG : IsClosed (stabilizerSubgroup : Set G)
  lieAlgebraStabilizer : LieSubalgebra (LieAlgebra G)
  dimensionStabilizer : Nat
  dimensionOrbit : Nat
  dimensionFormula : dimensionStabilizer + dimensionOrbit = dimension G

structure OrbitStabilizerEvidence {G : Type u} [AlgebraicGroup G] {V : Type v} [Variety V]
    (act : GroupActionOnVariety G V) (x : V) (orb : Orbit act x) (stab : Stabilizer act x) where
  orbitClosedClosed : orb.orbitClosed
  stabilizerClosedInGClosed : stab.stabilizerClosedInG
  dimensionFormulaClosed : stab.dimensionFormula

def OrbitStabilizerClosed {G : Type u} [AlgebraicGroup G] {V : Type v} [Variety V]
    (act : GroupActionOnVariety G V) (x : V) (orb : Orbit act x) (stab : Stabilizer act x) : Prop :=
  orb.orbitClosed ∧ stab.stabilizerClosedInG ∧ stab.dimensionFormula

theorem orbit_stabilizer_closed_from_evidence {G : Type u} [AlgebraicGroup G] {V : Type v} [Variety V]
    (act : GroupActionOnVariety G V) (x : V) (orb : Orbit act x) (stab : Stabilizer act x)
    (E : OrbitStabilizerEvidence act x orb stab) : OrbitStabilizerClosed act x orb stab :=
  And.intro E.orbitClosedClosed (And.intro E.stabilizerClosedInGClosed E.dimensionFormulaClosed)

end GroupActionsVarietiesSchemesQuotientsCanonicalLaneLean
end HautevilleHouse
