Inductive btree : Set :=
  | leaf : btree
  | node : nat -> btree -> btree -> btree.

Fixpoint mirror (A: btree) : btree :=
  match A with
  | leaf => leaf
  | node n fg fd => node n (mirror fd) (mirror fg)
end.

Lemma mirror_mirror :
  forall a: btree,
  mirror (mirror a) = a.
Proof.
intros.
induction a;
simpl.
reflexivity.
rewrite IHa1.
rewrite IHa2.
reflexivity.
Qed.

Fixpoint tmap (f: nat->nat) (t: btree): btree :=
  match t with
  | leaf => leaf
  | node n fg fd => node (f n) (tmap f fg) (tmap f fd)
end.

Lemma tmap_tmap :
  forall (f g: nat->nat) (a: btree),
  tmap f (tmap g a) = tmap (fun x => f (g x)) a.
Proof.
intros.
induction a;
simpl.
reflexivity.
rewrite IHa1.
rewrite IHa2.
reflexivity.
Qed.

Fixpoint btree_to_list (a: btree): list nat:=
  match a with
  | leaf => nil
  | node n fg fd => (btree_to_list fg)++(n::nil)++(btree_to_list fd)
end.

Require Import List.

Fixpoint map (f:nat->nat) (l:list nat): list nat:=
  match l with 
  nil => nil
  | tete::queue => (f tete)::(map f queue)
end.

Lemma mappend :
  forall (l1 l2: list nat) (f: nat->nat),
  map f (l1++l2) = (map f l1)++(map f l2).
Proof.
  intros.
  induction l1.
  simpl.
  reflexivity.
  simpl.
  rewrite <- IHl1.
  reflexivity.
Qed.

Lemma tmap_list :
  forall (f: nat->nat) (a:btree) (l:list nat),
  btree_to_list (tmap f a) = map f (btree_to_list a).
Proof.
intros.
induction a.
simpl.
reflexivity.
simpl.
rewrite IHa1.
rewrite IHa2.
rewrite mappend.
reflexivity.
Qed.

Fixpoint btree_in (x: nat) (t: btree) : Prop :=
match t with
| leaf => False
| node e l r => (btree_in x l) \/ e=x \/ (btree_in x r)
end.

Lemma btree_in_list:
  forall x t,
  btree_in x t -> In x (btree_to_list t).
Proof.
intros.
induction t;
simpl.
trivial.
Check in_or_app.
apply in_or_app.
simpl.
destruct H.
left.
apply IHt1.
trivial.
destruct H.
right.
left.
trivial.
right.
right.
apply IHt2.
trivial.
Qed.

Lemma btree_in_mirror_1:
  forall t x,
  btree_in x t -> btree_in x (mirror t).
Proof.
intros.
induction t;
simpl.
trivial.
simpl in H.
destruct H.
right.
right.
apply IHt1.
trivial.
destruct H.
right.
left.
trivial.
left.
apply IHt2.
trivial.
Qed.


Lemma btree_in_mirror_2:
  forall t x,
  btree_in x (mirror t) -> btree_in x t.
Proof.
intros.
rewrite <- mirror_mirror.
apply btree_in_mirror_1.
trivial.
Qed.













