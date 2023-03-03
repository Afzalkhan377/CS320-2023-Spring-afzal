(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-01: 10 points
*)
(* ****** ****** *)
(*
Given a list xs, list_pairing(xs) returns
a list of pairs and an option; the 1st pair
consists of the first and last elements in xs,
and the 2nd pair consists of the second and the
second last elements in xs, and so on and so forth;
and the option is NONE if |xs| is even, and it is
SOME(xm) if |xs| is odd and xm is the middle element
in xs.
//
For instance, we have:
//
list_pairing([]) = ([], NONE)
list_pairing([1]) = ([], SOME(1))
list_pairing([1,2]) = ([(1,2)], NONE)
list_pairing([1,2,3]) = ([(1,3)], SOME(2))
list_pairing([1,2,3,4]) = ([(1,4),(2,3)], NONE)
//
*)
(* ****** ****** *)
(*
fun
list_pairing
(xs: 'a list): ('a * 'a) list * 'a option = ...
*)


fun helper(i: int)(xs: 'a list): 'a list =
    if i <= 0
       then []
    else
    case xs of
         [] => []
         |x1::xs => x1::helper(i-1) xs

fun helper2(xs: 'a list)(i: int): 'a =
    if i< 0 then raise ListSubscript320
    else
    case xs of
         [] => raise ListSubscript320
         |x1::xs => if i = 0 then x1 else helper2(xs)(i-1)
         
fun list_pairing(xs: 'a list): ('a * 'a) list * 'a option =
    let
    val b = if (list_length(xs) mod 2) <>0 then SOME(helper2(xs) (list_length(xs) div 2)) else  NONE 
    val a = list_zip2(helper(list_length(xs) div 2) xs, helper(list_length(xs) div 2)(list_reverse(xs)))
    in
    (a, b)
    end
(* does not work
let
    fun helper(xs: 'a list, ys: 'a list): ('a * 'a) list * 'a option =
      case (xs, ys) of
        ([], []) => ([], NONE)
      | ([x], []) => ([], SOME x)
      | (x::xs, []) => let
      val (rest_pairs, middle) = helper(xs, [])
      in
      ((x, x)::rest_pairs, middle)
      end
      | (x::xs, y    helper(xs, []))
*)
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_pairing.sml] *)
