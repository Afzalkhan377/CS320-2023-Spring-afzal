(* ****** ****** *)
(*
HX-2023-01-22:
Library functions
for BUCASCS320-2023-Spring
This is an individual library, which
is not shared by the class.
//
Please build it up for your OWN use.
//
*)
(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-mysmlib-ind.sml] *)
fun list_tabulate(n: int, f: int -> 'a): 'a list=
let fun helper( n:int, f:int ->'a, li:'a list):'a list=

if n=0 then li

else

helper (n-1,f,f(n-1)::li)

in


helper(n,f,[])

end