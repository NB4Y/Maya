Fixpoint myplus (n m:nat) :=
match m with
0 => n
| S p => myplus (S n) p
end.

Eval compute in myplus 4 5.

Lemma myplys_Sn_m :
  forall (n m:nat),
  myplus (S n) m = S (myplus n m).
Proof.
intros.
induction m.
simpl.
reflexivity.
simpl.
rewrite IHm.
simpl.
reflexivity.