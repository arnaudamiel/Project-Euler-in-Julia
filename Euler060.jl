#= Prime pair sets
Problem 60 

The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For 

example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this 

property.
 
Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.

=#

function solve060()

    #Started with MAXPrime = 10000 but adjusted to a number greater than the initially found solution to garantee minimum result
    MAXPrime = 30000

    thePrimes = primes(MAXPrime)

    howManyPrimes = length(thePrimes)

    minSum = MAXPrime * 5

    ArrayOfConcat=falses(thePrimes[length(thePrimes)],thePrimes[length(thePrimes)])


    for a in thePrimes, b in thePrimes
        if isprime(a * (10^ndigits(b)) + b) && isprime(b * (10^ndigits(a)) + a)
            ArrayOfConcat[a,b] = true
        end
    end


    for a = [2:howManyPrimes-4], b = [a+1:howManyPrimes-3]
        v = thePrimes[a]
        w = thePrimes[b]
        if ArrayOfConcat[v,w] && v+w < minSum
            for c = [b+1:howManyPrimes-2]
                x = thePrimes[c]
                if ArrayOfConcat[v,x] && ArrayOfConcat[w,x] && v+w+x < minSum
                    for d = [c+1:howManyPrimes-1]
                        y = thePrimes[d]
                        if ArrayOfConcat[v,y] && ArrayOfConcat[w,y] && ArrayOfConcat[x,y] && v+w+x+y < minSum
                            for e = [d+1:howManyPrimes]
                                z = thePrimes[e]
                                if ArrayOfConcat[v,z] && ArrayOfConcat[w,z] && ArrayOfConcat[x,z] && ArrayOfConcat[y,z] && v+w+x+y+z < minSum
                                    minSum = v+w+x+y+z
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    minSum

end

using Base.Test

@test solve060() == 26033
