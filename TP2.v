<<<<<<< Updated upstream
Require Import ZArith.
Open Scope Z_scope.

Inductive gauss : Set := 
Gauss : Z -> Z -> gauss.

Definition g0 : gauss :=
Gauss 0 0.

Definition g1 : gauss :=
Gauss 1 0.

Definition gi : gauss :=
Gauss 0 1.

Definition gadd (a: gauss) (b: gauss) : gauss :=
  let 'Gauss x1 y1 := a in
  let 'Gauss x2 y2 := b in
  Gauss (x1 + x2) (y1 + y2).

Definition gsub (a: gauss) (b: gauss) : gauss :=
  let 'Gauss x1 y1 := a in
  let 'Gauss x2 y2 := b in
  Gauss (x1 - x2) (y1 - y2).

Definition gmul (a: gauss) (b: gauss) : gauss :=
  let 'Gauss x1 y1 := a in
  let 'Gauss x2 y2 := b in
  Gauss (x1 * x2 - y1 * y2) (x1 * y2 + x2 * y1).

Lemma l0 :
  forall (a : gauss),
  gadd g0 a = a.
Proof.
intros.
destruct a.
simpl.
reflexivity.
Qed.

Lemma ass : 
  forall (a b c : gauss),
  gadd (gadd a b) c =   gadd a (gadd b c).
Proof.
intros.
destruct a.
destruct b.
destruct c.
simpl.
rewrite Zplus_assoc.
rewrite Zplus_assoc.
reflexivity.
Qed.

Lemma comm :
  forall (a b : gauss),
  gadd a b = gadd b a.
Proof.
intros.
destruct a.
destruct b.
simpl.
rewrite Zplus_comm.
rewrite (Zplus_comm z0 z2).
reflexivity.
Qed.

Inductive jour : Set :=
| Lundi : jour
| Mardi : jour
| Mercredi : jour
| Jeudi : jour
| Vendredi : jour
| Samedi : jour
| Dimanche : jour.

Definition jour_suivant (j:jour) : jour :=
match j with
| Lundi => Mardi
| Mardi => Mercredi
| Mercredi => Jeudi
| Jeudi => Vendredi
| Vendredi => Samedi
| Samedi => Dimanche
| Dimanche => Lundi
end.

Definition jour_precedent (j:jour) : jour :=
match j with
| Lundi => Dimanche
| Mardi => Lundi
| Mercredi => Mardi
| Jeudi => Mercredi
| Vendredi => Jeudi
| Samedi => Vendredi
| Dimanche => Samedi
end.

Lemma jsjp :
  forall (j : jour),
  jour_suivant(jour_precedent(j)) = j.
Proof.
intros.
destruct j;
split.
Qed.

Lemma jpjs :
  forall (j : jour),
  jour_precedent(jour_suivant(j)) = j.
Proof.
intros.
destruct j;
simpl;
reflexivity.
Qed.

Fixpoint iter (f: jour->jour) (j:jour) (n:nat) :=
match n with
O => j
| S p => f (iter f j p)
end.












=======
Require Import ZArith.
Open Scope Z_scope.

Inductive gauss : Set := 
Gauss : Z -> Z -> gauss.

Definition g0 : gauss :=
Gauss 0 0.

Definition g1 : gauss :=
Gauss 1 0.

Definition gi : gauss :=
Gauss 0 1.

Definition gadd (a: gauss) (b: gauss) : gauss :=
  let 'Gauss x1 y1 := a in
  let 'Gauss x2 y2 := b in
  Gauss (x1 + x2) (y1 + y2).

Definition gsub (a: gauss) (b: gauss) : gauss :=
  let 'Gauss x1 y1 := a in
  let 'Gauss x2 y2 := b in
  Gauss (x1 - x2) (y1 - y2).

Definition gmul (a: gauss) (b: gauss) : gauss :=
  let 'Gauss x1 y1 := a in
  let 'Gauss x2 y2 := b in
  Gauss (x1 * x2 - y1 * y2) (x1 * y2 + x2 * y1).

Lemma l0 :
  forall (a : gauss),
  gadd g0 a = a.
Proof.
intros.
destruct a.
simpl.
reflexivity.
Qed.

Lemma ass : 
  forall (a b c : gauss),
  gadd (gadd a b) c =   gadd a (gadd b c).
Proof.
intros.
destruct a.
destruct b.
destruct c.
simpl.
rewrite Zplus_assoc.
rewrite Zplus_assoc.
reflexivity.
Qed.

Lemma comm :
  forall (a b : gauss),
  gadd a b = gadd b a.
Proof.
intros.
destruct a.
destruct b.
simpl.
rewrite Zplus_comm.
rewrite (Zplus_comm z0 z2).
reflexivity.
Qed.
>>>>>>> Stashed changes
