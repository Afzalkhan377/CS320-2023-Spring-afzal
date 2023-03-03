(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-04: 10 points
*)
(* ****** ****** *)
(*
Magic Triangle:
             1
           1   1
         1   2   1
       1   3   3   1
     1   4   6   4   1
   1   5   10  10  5   1
 1   6   15  20  15  6   1

THe magic triangle has the following structure:
- All numbers on the left and right borders are 1.
- All numbers in the interior (non-border) are the sum of the
  numbers in the row directly above it.

The following example shows how row 5 is computed from row 4.

row 4:      1     4     6     4    1
           / \   / \   / \   / \  / \
row 5:    1   1+4   4+6   6+4  4+1   1


We can represent a magic triangle in SML as an int list list where each row
is stored as a nested int list.

row 0  [[1]
row 1   [1,  1]
row 2   [1,  2,  1]
row 3   [1,  3,  3,  1]
row 4   [1,  4,  6,  4,  1]
row 5   [1,  5,  10, 10, 5,  1]
row 6   [1,  6,  15, 20, 15, 6,  1]]
...


Please implement a function that produces a magic triangle with n row.

triangle 0 = [[1]]
triangle 1 = [[1], [1, 1]]
triangle 2 = [[1], [1, 1], [1, 2, 1]]
triangle 3 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
triangle 4 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
...
triangle n = ???

Hint: You might want a helper function to compute the current row from
the previous.

*)

(* ****** ****** *)

(*
fun
magic_triangle (n : int) : int list list = ...
*)



(*
fun sums(xs:int list):int list=
case xs of
[] => []
| [x] => []
| x1 :: x2 :: xs => (x1 + x2) :: sums(x2 :: xs)



fun helper2(xs:int list):int list=
1::sums[xs] @ [1]
*)


fun helper2(xs : int list) : int list =
    let
        fun sums (xs : int list) : int list =
            case xs of
                [] => []
                | [x] => []
                | x1 :: x2 :: xs => (x1 + x2) :: sums(x2 :: xs)
    in
        1 :: sums(xs) @ [1]
    end

fun helper(i:int, j:int list, acc : int list list, k: int):int list list =
case k>=i of
true=>acc
|false=>
helper(i,helper2(j),helper2(j)::acc,k+1)


fun
magic_triangle (n : int) : int list list =
 if n=0 then list_reverse(helper(1,[1],[[1]], 1)) else
    list_reverse(helper(n+1,[1],[[1]], 1))


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-magic_triangle.sml] *)
B