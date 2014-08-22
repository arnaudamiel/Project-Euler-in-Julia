#= Prime power triples
Problem 87

The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power is 28. In fact, there are exactly four numbers below fifty that can be expressed in such a way:
 
28 = 2^2 + 2^3 + 2^4
33 = 3^2 + 2^3 + 2^4
49 = 5^2 + 2^3 + 2^4
47 = 2^2 + 3^3 + 2^4
 
How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and prime fourth power?

=#

function solve087()

    MAX = 50000000

    myPrimes = primes(ifloor(sqrt(MAX)))

    mySquares = Array(Int,length(myPrimes))
    myCubes = Array(Int,length(myPrimes))
    myFourth = Array(Int,length(myPrimes))

    for i = 1:length(myPrimes)
        mySquares[i] = myPrimes[i]*myPrimes[i]
        myCubes[i] = mySquares[i]*myPrimes[i]
        myFourth[i] = mySquares[i]*mySquares[i]
    end

    isSum = falses(MAX)

    for a in mySquares, b in myCubes, c in myFourth
        if a+b+c < MAX
            isSum[a+b+c] = true
        end
    end

    counter = 0
    for i in isSum
        if i
            counter += 1
        end
    end

    counter

end

using Base.Test
@test solve087() == 1097343
