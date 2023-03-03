(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-02: midterm-06: 20 points
//
Given a list of integers xs, list_grouping(xs)
returns a list of pairs (n, x) where n indicates
the number of times x occurs in xs; for each x in
xs, there must be a pair (n, x) for some n in the
returned list.
//
For instance,
list_grouping([1,2]) = [[1,1], [1,2]]
list_grouping([1,2,2,2,1]) = [[2,1], [3,2]]
list_grouping([1,2,1,2,3]) = [[2,1], [2,2], [1,3]]
//
In order to receive full credit, your implementation
should be able to handle a list containing 1M elements
in less than 10 seconds (mine can do it in less than
two seconds)
//
*)
(* ****** ****** *)

(*
fun
list_grouping(xs: int list): (int * int) list = ...
*)

(* ****** ****** *)

(*
Some testing code:
val N = 1000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)
(* ****** ****** *)




fun count_occurrences(x: int, xs: int list): int =
      list_length(list_filter(xs, fn y => x = y))





fun list_grouping(xs: int list): (int * int) list = 
let

fun tuples(xs:int list, ys: (int * int) list): (int * int) list=

case xs of
[]=>ys

|x::xs=> let


val help= (count_occurrences(x,xs)+1,x)::ys
val helper=list_filter(xs,fn(c)=>c<>x)
in tuples(helper,help)
end
in list_reverse(tuples(xs,[]))
end




(*
Some testing code:
Your implementation needs to be efficient to pass the
following test:
val N = 1000000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_grouping.sml] *)
