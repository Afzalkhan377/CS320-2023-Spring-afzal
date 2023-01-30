use "./../assign01.sml"; 



fun helper(xs: 'a xlist, c: int): int =
case xs of
xlist_nil=>c
|
xlist_cons(x1,xs) => helper(xs, c+1)


fun xlist_size(xs: 'a xlist): int =
helper(xs, 0)





