#The prime 41, can be written as the sum of six consecutive primes:
 
#41 = 2 + 3 + 5 + 7 + 11 + 13
 
#This is the longest sum of consecutive primes that adds to a prime below one-hundred.
 
#The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
 
#Which prime, below one-million, can be written as the sum of the most consecutive primes?

function solve050()

    MAX = 1000000

    myPrimes=primes(MAX)

    maxSum=0
    maxLength=0
    theSum = 0

    theBigSum = sum(myPrimes)

    for i = length(myPrimes):-1:2
        theSum = theBigSum
        for j = 1:(i-1)
            if (theSum < MAX) && (i-j > maxLength) && isprime(theSum)
                maxSum = theSum
                maxLength = i-j
            end
            theSum -= myPrimes[j]
        end
        theBigSum -= myPrimes[i]
    end

    maxSum
end

solve050()

#997651
