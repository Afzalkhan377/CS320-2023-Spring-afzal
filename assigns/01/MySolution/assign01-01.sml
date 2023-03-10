


use "./../assign01-lib.sml";


val list_append = op@
val list_reverse = List.rev


exception XlistConsMatch
exception XlistSubscript



datatype 'a xlist =
xlist_nil
|
xlist_cons of ('a * 'a xlist)
|
xlist_snoc of ('a xlist * 'a)
|
xlist_append of ('a xlist * 'a xlist)
|
xlist_reverse of ('a xlist)


fun
list_of_xlist(xs: 'a xlist): 'a list =
(
case xs of
xlist_nil => []
|
xlist_cons(x1, xs) => x1 :: list_of_xlist(xs)
|
xlist_snoc(xs, x1) => list_of_xlist(xs) @ [x1]
|
xlist_append(xs, ys) => list_of_xlist(xs) @ list_of_xlist(ys)
|
xlist_reverse(xs) => list_reverse(list_of_xlist(xs))
)

fun helper(xs: 'a xlist, c: int): int =
case xs of
xlist_nil=>c
|
xlist_cons(x1,xs)=>helper(xs,c+1)
|
xlist_snoc(xs, x1) => helper(xs,c+1)
|
xlist_append(xs, ys) => helper(xs,c) + helper(ys,0)
|
xlist_reverse(xs) => helper(xs,c)



fun xlist_size(xs: 'a xlist): int =
    helper(xs,0)