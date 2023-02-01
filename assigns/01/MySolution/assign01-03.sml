use "./../assign01-lib.sml";
use "./../MySolution/assign01-01.sml";





fun xlist_remove_reverse(xs: 'a xlist): 'a xlist=

let fun helper(xs: 'a xlist): 'a xlist=
(
case xs of

xlist_nil => xlist_nil
|
xlist_cons(x1,xs) =>xlist_snoc(helper(xs),x1)
|
xlist_snoc(xs,x1) =>xlist_cons(x1,helper(xs))
|
xlist_append(xs,ys) => xlist_append(helper(ys),helper(xs))
|
xlist_reverse(xs) => xs
)
in

helper(xs)

end