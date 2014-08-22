#= Prime power triples
Problem 87

The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power is 28. In fact, there are exactly four numbers below fifty 

that can be expressed in such a way:
 
28 = 2^2 + 2^3 + 2^4
33 = 3^2 + 2^3 + 2^4
49 = 5^2 + 2^3 + 2^4
47 = 2^2 + 3^3 + 2^4
 
How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and prime fourth power?

=#

function primeCount(n::Int)

    ifloor(1.25506 * n / log(n))

end

function solve087()

    MAX = 50000000

    maxSquares = ifloor(sqrt(MAX))
    maxCubes = ifloor(cbrt(MAX))
    maxFourth = ifloor(MAX^(1/4))

    myPrimes = primes(maxSquares)

    mySquares = Array(Int,length(myPrimes))
    myCubes = Array(Int,primeCount(maxCubes))
    myFourth = Array(Int,primeCount(maxFourth))

    for i = 1:length(mySquares)
        @inbounds mySquares[i] = myPrimes[i]*myPrimes[i]
    end

    for i = 1:length(myCubes)
        @inbounds myCubes[i] = mySquares[i]*myPrimes[i]
    end

    for i = 1:length(myFourth)
        @inbounds myFourth[i] = mySquares[i]*mySquares[i]
    end

    isSum = falses(MAX)

    for a in mySquares, b in myCubes, c in myFourth
        if a+b+c < MAX
            @inbounds isSum[a+b+c] = true
        end
    end

    sum(isSum)

end

using Base.Test
@test solve087() == 1097343
