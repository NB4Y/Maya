Inductive liste (A:Set) : Set :=
| nil : liste A
| cons : A -> liste A -> liste A.

Fixpoint length (A:Set) (l:liste A) : nat :=
  match l with
    nil _ => 0
  | cons _ tete queue  => S (length A queue)
end.

Fixpoint map {A:Set} {B:Set} (f:A->B) (l:liste A): liste B:=
  match l with 
  nil _ => nil B
  | cons _ tete queue => cons B (f tete) (map f queue)
end.


Check cons nat 1 (nil nat).
Eval compute in length nat (cons nat 4 (cons nat 1 (nil nat))).
Eval compute in map (fun x => x * 2) (cons nat 4 (cons nat 1 (nil nat))).
Eval compute in length nat (map (fun x => x * 2) (cons nat 4 (cons nat 1 (nil nat)))).

Fixpoint append {A: Set} (l1 l2: liste A) : liste A :=
  match l1 with
  nil _ => l2
| cons _ tete queue => cons A tete (append queue l2)
end.

Eval compute in append (cons nat 4 (cons nat 1 (nil nat))) (map (fun x => x * 2) (cons nat 4 (cons nat 1 (nil nat)))).

Lemma mappend :
  forall (A: Set) (l1 l2: liste A) (f: A -> A),
  map f (append l1 l2) = append (map f l1) (map f l2).
Proof.
  intros.
  induction l1.
  simpl.
  reflexivity.
  simpl.
  rewrite <- IHl1.
  reflexivity.
Qed.


Fixpoint reverse {A: Set} (l: liste A) : liste A :=
  match l with
  nil _ => nil A
| cons _ tete queue => append (reverse queue) (cons A tete (nil A))
end.

Lemma maperse :
  forall (A: Set) (l: liste A) (f: A -> A),
  map f (reverse l) = reverse (map f l).
Proof.
  intros.
  induction l.
  simpl.
  reflexivity.
  simpl.
  rewrite <- IHl.
  rewrite mappend.
  simpl.
  reflexivity.
Qed.

Lemma appenil :
  forall (A: Set) (l: liste A),
  append l (nil A) = l.
Proof.
intros.
induction l.
simpl.
reflexivity.
simpl.
rewrite IHl.
reflexivity.
Qed.

Lemma appendative :
  forall (A: Set) (a b c: liste A),
  append a (append b c) = append (append a b) c.
Proof.
intros.
induction a.
simpl.
reflexivity.
simpl.
rewrite IHa.
reflexivity.
Qed.

Lemma reverseappend :
  forall (A: Set) (l1 l2: liste A),
  reverse (append l1 l2) = append (reverse l2) (reverse l1).
Proof.
intros.
induction l1.
simpl.
rewrite appenil.
reflexivity.
simpl.
rewrite IHl1.
rewrite appendative.
reflexivity.
Qed.


Lemma reversereverse :
  forall (A: Set) (l: liste A),
  reverse (reverse l) = l.
Proof.
intros.
induction l.
simpl.
reflexivity.
simpl.
rewrite reverseappend.
rewrite IHl.
simpl.
reflexivity.
Qed.

Require Export ArithRing.

Lemma lengthappend :
  forall (A: Set) (l1 l2: liste A),
  length A (append l1 l2) = length A l1 + length A l2.
Proof.
intros.
induction l1.
simpl.
reflexivity.
simpl.
rewrite IHl1.
reflexivity.
Qed.

Lemma lengthreverse :
  forall (A: Set) (l: liste A),
  length A (reverse l) = length A l.
Proof.
intros.
induction l.
simpl.
reflexivity.
simpl.
rewrite lengthappend.
rewrite IHl.
simpl.
ring.
Qed.


Fixpoint foldr {A B: Set} (f: A->B->B) (z: B) (l: liste A) : B :=
  match l with
  nil _ => z
|  cons _ tete queue => f tete (foldr f z queue)
end.

Lemma foldrappend:
  forall {A B: Set} (f: A->B->B) (z: B) (l1 l2: liste A),
  foldr f z (append l1 l2) = foldr f (foldr f z l2) l1.
Proof.
intros.
induction l1.
simpl.
reflexivity.
simpl.
rewrite IHl1.
reflexivity.
Qed.

Lemma foldmap:
  forall {A B: Set} (f: A->B) (h: A) (q: B) (l: liste A),
  foldr (fun h q => cons B (f h) q) (nil B) l = map f l.
Proof.
intros.
induction l.
simpl.
reflexivity.
simpl.
rewrite IHl.

Qed.











