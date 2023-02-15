(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

fun list_maker(ys:int list): int list=
case ys of
[]=>[]
|x1::x2::ys=>if x1<=x2 then x1::list_maker(x2::xs)
else list_maker(x1::xs)





fun helper(xs:int list, ys:int list): int list=
case xs of
[]=> ys
|x::xs=>let val zs=list_maker(xs)
	    in
	    if list_length(zs)> list_length(ys) then
	    helper(xs',zs)
	    else
	    helper(xs',ys)
	    end
fun list_longest_ascend(xs: int list): int list=
helper(xs,[])








(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-04.sml] *)
