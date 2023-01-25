
fun PrimeCheck(x: int): bool=
    let fun Checker(current:int): bool=
    if current >= x then true
    else if x mod current =0  then false
    else Checker(current+1)
    in

    Checker(2)

    end
    
fun isPrime(n0: int): bool =
    if n0<=2 then true else PrimeCheck(n0)
    

    
    