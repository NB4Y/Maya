Inductive liste (A:Set) : Set :=
| nil  : liste A
| cons : A -> liste A -> liste A.

Check liste_ind.

(**
liste_ind
     : forall (A : Set) (P : liste A -> Prop),
       P (nil A) ->
       (forall (a : A) (l : liste A),
        P l -> P (cons A a l)) ->
       forall l : liste A, P l
**)

(** MAP **)

Fixpoint length {A:Set} (l:liste A) :nat :=
  match l with
  | nil _ => 0
  | cons _ h list => 1 + length list
end.

Fixpoint map {A B:Set} (f:A->B) (l:liste A) :liste B :=
  match l with
  | nil _ => nil B
  | cons _ h list => cons B (f h) (map f list)
end.

Check cons nat 1 (nil nat).
Eval compute in length (cons nat 4 (cons nat 1 (nil nat))).
Eval compute in map (fun x => x * 2) (cons nat 4 (cons nat 1 (nil nat))).