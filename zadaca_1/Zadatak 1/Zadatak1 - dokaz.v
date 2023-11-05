Require Import Bool.

Notation "! x" := (negb x) (at level 20).

Goal forall x y : bool, 
  (x && !y) || (!x && !y) || (!x && y) 
  = !x || !y.
Proof.
  now destruct x, y.
Qed.

Goal forall x y z : bool,
  !(!x && y && z) || !(x && y && !z) || (x && !y && z)
  = true.
Proof.
  now destruct x, y, z.
Qed.