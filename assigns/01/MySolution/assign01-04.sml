

val ord = Char.ord (* char to ascii *)
val chr = Char.chr (* ascii to char *)


val str = String.str (* char to string *)


val strlen =String.size (* string length *)

val strcat = op^ (* string concatenation *)
val strsub = String.sub (* string subcripting *)








fun exponent(x: int, extra: int, num: int): int=
if num=1 then x
else if num= 0 then 1
else
exponent(x*extra,extra, num-1)

fun str2int2(cs: string, n: int): int =
if String.size(cs)-1=n
   then (Char.ord(String.sub(cs,n)) - 48)
else
	str2int2(cs,n+1) + ((Char.ord(String.sub(cs,n)) - 48) * exponent(10, 10, String.size(cs) - n - 1))

fun str2int(cs: string): int =
str2int2(cs,0)





fun number_checker(cs: string, count: int): bool=
if (Char.ord(String.sub(cs,count)) - 48)>=0 andalso (Char.ord(String.sub(cs,count)) - 48)<=9 then true else false


fun check(cs:string, count:int): bool=
if String.size(cs)<=0 then false
else if String.size(cs)-1=count then number_checker(cs, count)
else if number_checker(cs,count)=true then check(cs, count+1)
else false

fun str2int_helper(cs: string): int option=
if check(cs,0)=true then SOME(str2int(cs)) else NONE

fun str2int_opt(cs: string): int option=
str2int_helper(cs)

