Set Implicit Arguments.
Require Import List.
Import ListNotations.
Require Import Lia.

(* Bit *)

Inductive B : Type :=
  | O : B
  | I : B.

Definition And (x y : B) : B :=
match x with
  | O => O
  | I => y
end.

Definition Or (x y : B) : B :=
match x with
  | O => y
  | I => I
end.

Definition Not (x : B) : B :=
match x with
  | O => I
  | I => O
end.

Definition Add (x y c : B) : B :=
match x, y with
  | O, O => c
  | I, I => c
  | _, _ => Not c
end.

Definition Rem (x y c : B) : B :=
match x, y with
  | O, O => O
  | I, I => I
  | _, _ => c
end.

(* List *)

Fixpoint AndL (x y : list B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => And x y :: AndL xs ys
end.

Fixpoint OrL (x y : list B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => Or x y :: OrL xs ys
end.

Fixpoint NotL (x : list B) : list B :=
match x with
  | [] => []
  | x :: xs => Not x :: NotL xs
end.

Fixpoint AddLr (x y : list B) (c : B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => Add x y c :: AddLr xs ys (Rem x y c)
end.

Definition AddL (x y : list B) : list B := rev (AddLr (rev x) (rev y) O).

Fixpoint IncLr (x : list B) (c : B) : list B :=
match x with
| [] => []
| x :: xs => Add x I c :: IncLr xs (Rem x I c)
end.

Definition IncL (x : list B) : list B := rev (IncLr (rev x) O).

(* ALU *)

Definition flag_zx (f : B) (x : list B) : list B :=
match f with
| I => repeat O (length x)
| O => x
end.

Definition flag_nx (f : B) (x : list B) : list B :=
match f with
| I => NotL x
| O => x
end.

Definition flag_f (f : B) (x y : list B) : list B :=
match f with
| I => AddL x y
| O => AndL x y
end.

Definition ALU (x y : list B) (zx nx zy ny f no : B) : list B := 
  flag_nx no (flag_f f (flag_nx nx (flag_zx zx x)) (flag_nx ny (flag_zx zy y))).

(* Helpers *)

Lemma H_RevL_1 : forall (b : B) (n : nat), repeat b n ++ [b] = b :: repeat b n.
Proof.
  induction n; try now simpl.
  - simpl. now rewrite IHn.
Qed.

Lemma H_RevL_2 : forall (b : B) (n : nat), rev (repeat b n) = repeat b n.
Proof.
  induction n; try now simpl.
  - simpl. now rewrite IHn, H_RevL_1.
Qed.

Lemma H_NotL : forall (n : nat), NotL (repeat O n) = repeat I n.
Proof.
  induction n; try now simpl.
  - simpl. now rewrite <- IHn.
Qed.

Lemma H_AndL : forall (l : list B), AndL (repeat I (length l)) l = l.
Proof.
  induction l; try now simpl.
  - simpl. now rewrite IHl.
Qed.

Lemma H_AndRevL : forall (l : list B), AndL l (repeat I (length l)) = l.
Proof.
  induction l; try now simpl.
  - simpl. rewrite IHl. now destruct a.
Qed.

Lemma H_NotO : forall (m : nat), NotL (repeat O m) = repeat I m.
Proof.
  induction m; try now simpl.
  - simpl. now rewrite IHm.
Qed.

Lemma H_NotI : forall (m : nat), NotL (repeat I m) = repeat O m.
Proof.
  induction m; try now simpl.
  - simpl. now rewrite IHm.
Qed.

(* Teoremi *)

Lemma ALU_zero (x y : list B) :
  length x = length y -> ALU x y I O I O I O = repeat O (length x).
Proof.
  simpl. intros H.
  unfold AddL.

  assert(G : forall (n : nat), AddLr (repeat O n) (repeat O n) O = repeat O n).
  {
    induction n; try now simpl.
    - simpl. now f_equal.
  }

  now rewrite H, H_RevL_2, G, H_RevL_2.
Qed.

Lemma ALU_minus_one (x y : list B) : 
  length x = length y -> ALU x y I I I O I O = repeat I (length x).
Proof.
  intros H. simpl. unfold AddL.
  rewrite H, H_NotL, !H_RevL_2.

  assert (H_AddLr : forall (n : nat), AddLr (repeat I n) (repeat O n) O = repeat I n).
  {
    induction n; try now simpl.
    - simpl. now rewrite IHn.
  }

  now rewrite H_AddLr, H_RevL_2.
Qed.

Lemma ALU_x (x y : list B) : 
  length x = length y -> ALU x y O O I I O O = x.
Proof.
  simpl. intros G. 
  now rewrite <-G, H_NotL, H_AndRevL.
Qed.

Lemma ALU_y (x y : list B) : 
  length x = length y -> ALU x y I I O O O O = y.
Proof.
  simpl. intros G.
  now rewrite G, H_NotO, H_AndL.
Qed.

Lemma ALU_Not_x (x y : list B) : 
  length x = length y -> ALU x y O O I I O I = NotL x.
Proof.
  simpl. intros H.
  now rewrite <- H, H_NotL, H_AndRevL.
Qed.

Lemma ALU_Not_y (x y : list B) : 
  length x = length y -> ALU x y I I O O O I = NotL y.
Proof.
  simpl. intros H.
  now rewrite H, H_NotL, H_AndL.
Qed.

Lemma ALU_Add (x y : list B) : 
  length x = length y -> ALU x y O O O O I O = AddL x y.
Proof.
  now simpl.
Qed.

(* DZ *)

Lemma ALU_And (x y : list B) : 
  length x = length y -> ALU x y O O O O O O = AndL x y.
Proof.
  intros H. simpl. reflexivity.
Qed.

Lemma ALU_Or (x y : list B) : 
  length x = length y -> ALU x y O I O I O I = OrL x y.
Proof.
  intros H. simpl.

  assert (DNeg : forall(a : B), Not (Not a) = a).
  {
    now destruct a. 
  }

  assert (DeMorgan : forall (a b : B), Not (And a b) = Or (Not a) (Not b)).
  {
    now destruct a, b.
  }

  assert (Result : forall (a b : list B), (OrL a b) = NotL(AndL (NotL a) (NotL b) )).
  {
    intros a b. revert b. induction a, b ; try now simpl.
    - simpl. rewrite !DeMorgan, !DNeg.
      f_equal. specialize (IHa b0). apply IHa.
  }

  now rewrite Result.
Qed.

Lemma ALU_One (n : nat) (x y : list B) :
  length x = n /\ length y = n /\ n <> 0 -> ALU x y I I I I I I = repeat O (pred n) ++ [I].
Proof.
  intros [G1 [G2 G3]]. simpl.
  rewrite G1, G2, ! H_NotO.

  assert (L3 : forall (b b1 : B) (m : nat), rev (b1 :: repeat b m) = rev (repeat b m) ++ [b1]).
  {
    now induction m.
  }

  assert (H1 : forall (b b1 : B) (m : nat), NotL ((repeat b m) ++ [b1]) = (NotL (repeat b m)) ++ [(Not b1)]).
  {
    induction m; try now simpl.
    - simpl. now f_equal.
  }

  assert(H2 : forall (m : nat), AddLr (repeat I m) (repeat I m) I = repeat I m).
  {
    induction m; try now simpl.
    - simpl. now f_equal.
  }

  assert(H3 : forall(m : nat), (m <> 0) -> AddLr (repeat I m) (repeat I m) O = O :: (repeat I (Init.Nat.pred m))).
  {
    destruct m; try now simpl.
    - intros _. simpl. now f_equal.
  }

  unfold AddL.
  rewrite !H_RevL_2, H3.
  - now rewrite L3, H_RevL_2, !H1, H_NotI.
  - exact G3.
Qed.







