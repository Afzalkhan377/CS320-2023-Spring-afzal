use "./../assign00-lib.sml";


fun helper(cd: string, n: int): string=
if n = 0 then String.str((String.sub(cd,n)))
else if
String.size(cd)=0 then ""
else
 String.str((String.sub(cd,n)))^ helper(cd,n-1)


fun stringrev(cs: string): string=
helper(cs, String.size(cs)-1)
