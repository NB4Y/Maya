Lemma l0 :
  forall (A B C : Prop),
  ( (A -> B) /\ (B -> C) ) -> (A -> C).
Proof.
intros.
destruct H.
apply H1.
apply H.
assumption.
Qed.

Lemma l1 :
  forall (A B : Prop),
  (A \/ B) -> (B \/ A).
Proof.
intros.
destruct H.
right.
assumption.
left.
assumption.
Qed.

Lemma l2 :
  forall (A B C : Prop),
  ((A /\ B) -> C) -> A -> B -> C.
Proof.
intros.
apply H.
split.
assumption.
assumption.
Qed.

Lemma l3 :
  forall (A B C : Prop),
  (A -> B -> C) -> (A /\ B) -> C.
Proof.
intros.
destruct H0.
apply H.
assumption.
assumption.
Qed.

Lemma l4 :
  forall (A B C : Prop),
  (A /\ (B \/ C)) -> ((A /\ B) \/ (A /\ C)).
Proof.
intros.
destruct H.
destruct H0.
left.
split.
assumption.
assumption.
right.
split.
assumption.
assumption.
Qed.

Lemma l5 :
  forall (A B C : Prop),
  ((A /\ B) \/ (A /\ C)) -> (A /\ (B \/ C)).
Proof.
intros.
destruct H.
destruct H.
split.
assumption.
left.
assumption.
destruct H.
split.
assumption.
right.
assumption.
Qed.

Print l1.

Axiom tiers_exclu :
  forall A : Prop,
  A \/ ~A.

Lemma contrapposée :
  forall (A B : Prop),
  (A -> B) <-> (~B -> ~A).
Proof.
intros.
split.
intros.
intro.
apply H0.
apply H.
apply H1.
intros.
assert (Hx :=tiers_exclu B).
destruct Hx.
assumption.
destruct H.
assumption.
assumption.
Qed.

Lemma doubleNegation :
  forall (A : Prop),
  ~(~A) <-> A.
Proof.
intros.
assert (Hx :=tiers_exclu A).
split.
intro.
destruct Hx.
assumption.
destruct H.
assumption.
intro.
intro.
apply H0.
assumption.
Qed.

Lemma loiDePierce :
  forall (A B : Prop),
  ((A -> B) -> A) -> A.
Proof.
intros.
assert (Hx :=tiers_exclu A).
destruct Hx.
assumption.
apply H.
intros.
contradiction.
Qed.

Lemma fin:
forall (A : Set) (B : A -> A -> Prop),
(exists y : A, (forall x : A, B x y)) -> (forall x : A, exists y : A, B x y).
Proof.
intros.
destruct H.
exists x0.
apply H.
Qed.
















