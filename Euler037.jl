#The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
 
#Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
 
#NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

function number(theDigits)

    counter = 0

    for i = length(theDigits):-1:1
        counter *= 10
        counter += theDigits[i]
    end

    counter

end

function isTruncablePrime(n)

    if !isprime(n)
        return(false)
    end
   
    theDigits=digits(n)

    for i = 1:(length(theDigits)-1)
       pop!(theDigits)
       if !isprime(number(theDigits))
           return(false)
       end
    end 

    theDigits=digits(n)

    for i = 1:(length(theDigits)-1)
       shift!(theDigits)
       if !isprime(number(theDigits))
           return(false)
       end
    end

    true

end

function solve037()

    counter = 0
    numberFound = 0

    for i in primes(1000000)
        if isTruncablePrime(i)
            counter += i
            #println(i)
        end
        if numberFound == 11+length([2 3 5 7])
            break
        end
    end

    counter-sum([2 3 5 7])

end

solve037()

#748317
