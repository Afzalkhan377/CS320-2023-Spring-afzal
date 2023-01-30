use "./../assign01-lib.sml";
use "./../MySolution/assign01-01.sml";






fun xlist_subhelper(xs: 'a xlist, i0: int): 'a =
case xs of
xlist_nil=> raise XlistSubscript
|
xlist_cons(x1,xs)=> if i0=0 then x1 else xlist_subhelper(xs,i0-1)
|
xlist_snoc(xs, x1) =>  if i0=0 then x1 else xlist_subhelper(xs,i0-1)
|
xlist_append(xs, ys) => if i0< xlist_size(xs) then xlist_subhelper(xs,i0-1) else  xlist_subhelper(ys,i0-xlist_size(xs))
|
xlist_reverse(xs) =>xlist_subhelper(xs, xlist_size(xs)-i0-1)


fun xlist_sub(xs: 'a xlist, i0: int): 'a=
if xlist_size(xs) < 0 orelse i0>= xlist_size(xs) then raise XlistSubscript else
xlist_subhelper(xs, i0)