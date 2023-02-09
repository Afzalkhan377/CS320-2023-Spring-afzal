####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign02.sml)
#
####################################################
def split(xs):
    if mylist_nilq(xs):
        return (mylist_nil(),mylist_nil())
    elif mylist_nilq(xs.get_cons2()):
        return (mylist_cons(xs.get_cons1(),mylist_nil()),mylist_nil())
    else:
        x1=xs.get_cons1()
        xs=xs.get_cons2()
        x2=xs.get_cons1()
        xs=xs.get_cons2()
        (ys,zs)=split(xs)
        return(mylist_cons(x1,ys),mylist_cons(x2,zs))

def merge(ys,zs):
    if mylist_nilq(ys):
        return zs
    elif mylist_nilq(zs):
        return ys
    else:
        y1=ys.get_cons1()
        z1=zs.get_cons1()
        if y1<=z1:
            return mylist_cons(y1,merge(ys.get_cons2(),zs))
        else:
            return mylist_cons(z1, merge(zs.get_cons2(),ys))

def mylist_mergesort(xs):
    if mylist_nilq(xs):
        return xs
    elif mylist_consq(xs):
        if mylist_nilq(xs.get_cons2()):
            return xs
        else:
            x1=xs.get_cons1()
            xs=xs.get_cons2()
            x2=xs.get_cons1()
            xs=xs.get_cons2()
            (ys,zs)=split(xs)
            return merge(mylist_mergesort(mylist_cons(x1,ys)),(mylist_mergesort(mylist_cons(x2,zs))))
