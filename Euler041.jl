#We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
 
#What is the largest n-digit pandigital prime that exists?

function number(theDigits)
    counter = 0
    for i = length(theDigits):-1:1
        counter *= 10
        counter += theDigits[i]
    end
    counter
end

function solve041()

    myPrime=0

    for numberOfDigits = 9:-1:1
        for i in permutations([1:numberOfDigits])
            if isprime(number(i))
                myPrime = number(i)>myPrime ? number(i) : myPrime           
            end
        end

        if myPrime != 0
            break
        end
    end

    myPrime

end

solve041()

#7652413
