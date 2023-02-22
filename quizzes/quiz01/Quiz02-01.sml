use "./../../../mysmlib/mysmlib-cls.sml";


val strlen=foreach_to_length(string_foreach)
val strsub=foreach_to_get_at(string_foreach)


fun counter( word: string, n:int,char2,char): int=
if strlen(word)=0 then 0 else if strlen(word)>0 andalso helper(strsub(s,n),char2) = true then 1 +(counter(word, n+1,char2)
else (counter(word, n+1,char2))


fun helper(char1:char, char2:char):bool=
if char1=char2 then true else false


fun quiz02_01(word: string):char->int=
fn c=>
counter(word, 0, c)
