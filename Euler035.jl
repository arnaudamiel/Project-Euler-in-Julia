#The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
 
#There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
 
#How many circular primes are there below one million?


function number(myDigits)

    myNumber = 0

    for i in myDigits
        myNumber *= 10
        myNumber += i
    end

    myNumber

end

function isCircularPrime(n)

    myDigits=reverse!(digits(n))
    
    for i = 1:length(myDigits)

        if !isprime(number(myDigits))
            return false
        end

        theDigit = shift!(myDigits)
        push!(myDigits,theDigit)

    end

    true        

end

function solve035()

    counter = 0

    for i in primes(1000000)
        if isCircularPrime(i)
            counter +=1
        end
    end

    counter

end

solve035()

#55
