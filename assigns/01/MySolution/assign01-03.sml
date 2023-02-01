use "./../assign01-lib.sml";
use "./../MySolution/assign01-01.sml";



fun helper(xs: 'a xlist, count:int): 'a xlist=
case xs of

xlist_nil => xlist_nil
|
xlist_cons(x1,xs) =>if count=xlist_size(xs) then xs else xlist_snoc(helper(xs,count+1),x1)
|
xlist_snoc(xs,x1) =>if count=xlist_size(xs) then xs else xlist_cons(x1,helper(xs,count+1))
|
xlist_append(xs,ys) => xlist_append(helper(ys,0),helper(xs,0))
|
xlist_reverse(xs) => if count=xlist_size(xs) then xs else helper(xs,0)



fun xlist_remove_reverse(xs: 'a xlist): 'a xlist=
helper(xs,0)