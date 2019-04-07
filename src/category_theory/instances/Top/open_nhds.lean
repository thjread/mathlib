import category_theory.instances.Top.opens

open category_theory
open category_theory.instances
open topological_space

universe u

namespace topological_space.open_nhds
variables {X Y : Top.{u}} (f : X ⟶ Y)

def inclusion (x : X.α) : open_nhds x ⥤ opens X :=
{ obj := λ U, U.val,
  map := λ U V i, i }

@[simp] lemma inclusion_obj (x : X.α) (U) (p) : (inclusion x).obj ⟨U,p⟩ = U := rfl

def map (x : X) : open_nhds (f x) ⥤ open_nhds x :=
{ obj := λ U, ⟨(opens.map f).obj U.1, by tidy⟩,
  map := λ U V i, (opens.map f).map i }

@[simp] lemma map_id_obj' {X : Top.{u}} (x : X) (U) (p) (q) : (map (𝟙 X) x).obj ⟨⟨U, p⟩, q⟩ = ⟨⟨U, p⟩, q⟩ :=
rfl
@[simp] lemma map_id_obj {X : Top.{u}} (x : X) (U) : (map (𝟙 X) x).obj U = U :=
by tidy

@[simp] lemma map_id_obj_unop {X : Top.{u}} (x : X) (U : (open_nhds x)ᵒᵖ) : (map (𝟙 X) x).obj (unop U) = unop U :=
by simp
@[simp] lemma op_map_id_obj {X : Top.{u}} (x : X) (U : (open_nhds x)ᵒᵖ) : (map (𝟙 X) x).op.obj U = U :=
by simp

def inclusion_map_iso (x : X) : inclusion (f x) ⋙ opens.map f ≅ map f x ⋙ inclusion x :=
nat_iso.of_components
  (λ U, begin split, exact 𝟙 _, exact 𝟙 _ end)
  (by tidy)

@[simp] lemma inclusion_map_iso_hom (x : X) : (inclusion_map_iso f x).hom = 𝟙 _ := rfl
@[simp] lemma inclusion_map_iso_inv (x : X) : (inclusion_map_iso f x).inv = 𝟙 _ := rfl

end topological_space.open_nhds