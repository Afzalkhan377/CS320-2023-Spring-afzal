####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign02.sml)
#
####################################################
def mylist_quiclsort(xs):
    qsort(xs)

def qsort(xs):
    if  mylist_nilq(xs)==0:
        return mylist_nil()
    else:
        ys,zs=qpart(xs,mylist_cons.get_cons1(xs))
        ys=qsort(ys)
        zs = qsort(zs)
        mylist_append(ys, mylist_cons(x1,zs))
