(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)



fun list_tabulate(n: int, f: int -> 'a): 'a list=
let fun helper( n:int, f:int ->'a, li:'a list):'a list=

if n=0 then li

else

helper (n-1,f,f(n-1)::li)

in


helper(n,f,[])

end

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-03.sml] *)
