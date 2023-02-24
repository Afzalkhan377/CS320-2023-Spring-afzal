(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-16: 30 points
//
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
Please give a NON-RECURSIVE implementation that solves the 8-queen puzzle.
//
type board_t =
int * int * int * int * int * int * int * int
//
fun
queen8_puzzle_solve(): board_t list =
(*
returns a list of boards consisting of all the solutions to the puzzle.
*)
//
*)

(* ****** ****** *)




type board_t=int*int*int*int*int*int*int*int

val board_foreach=fn(board1:board_t, work:int->unit)=> let

val(x0,x1,x2,x3,x4,x5,x6,x7)=board1

in

work(x0);work(x1);work(x2);work(x3);work(x4);work(x5);work(x6);work(x7);()
end


val board_get=fn(board1:board_t, i:int)=>
foreach_to_get_at(board_foreach)(board1,i)


val board= fn(board1:board_t ,i0:int ,j0:int)=>let
val(x1,x2,x3,x4,x5,x6,x7,x8)=board1
in
case i0 of
0=> (j0,x2,x3,x4,x5,x6,x7,x8)
|1=>(x1,j0,x3,x4,x5,x6,x7,x8)
|2=>(x1,x2,j0,x4,x5,x6,x7,x8)
|3=>(x1,x2,x3,j0,x5,x6,x7,x8)
|4=>(x1,x2,x3,x4,j0,x6,x7,x8)
|5=>(x1,x2,x3,x4,x5,j0,x7,x8)
|6=>(x1,x2,x3,x4,x5,x6,j0,x8)
|7=>(x1,x2,x3,x4,x5,x6,x7,j0)
|_=>board1


end


val safety_test1=fn(i0:int,j0:int,i:int,j:int)=>
(j0<>j) andalso abs_int(i0-i) <> abs_int(j0-j)

val safety_test2=fn(i0:int, j0:int, board1:board_t ,i:int)=>
if i>=0 then int1_forall(i,fn(x)=>
safety_test1(i0,j0,x,board_get(board1,x)))
else true


val r_c=fn(board1:board_t ,i0:int)=>
foreach_to_filter_list(int1_foreach)(8,fn(x)=>
safety_test2(i0,x,board1,i0))




val nb=fn(board_list: board_t list, i0:int)=> list_foldleft(board_list,[],fn(row,board1)=> let

val avail=r_c(board1,i0)

in case avail of

[]=>row

|_=> row @ list_map(avail,fn(x)=>board(board1,i0,x))
end)


val queen8_puzzle_solve=fn()=>
let val start=[(0,0,0,0,0,0,0,0)]
val board_list=int1_foldleft(8,start,fn(row,i0)=>nb(row,i0))
val board_list_plus_one = fn(board1:board_t)=>
let val(p,q,r,s,t,u,v,z)=board1 in(p+1,q+1,r+1,s+1,t+1,u+1,v+1,z+1)
end
val board_update=list_map(board_list,board_list_plus_one)

    in
        board_update

end



(* end of [CS320-2023-Spring-assign04-04.sml] *)
