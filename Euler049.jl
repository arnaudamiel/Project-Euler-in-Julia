#The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
 
#There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
 
#What 12-digit number do you form by concatenating the three terms in this sequence?

function number(myDigits::Array{Int,1})

    counter = 0
    for i = length(myDigits):-1:1
        counter *= 10
        counter += myDigits[i]
    end
    counter

end

function solve049()

    bigPrimes = primes(10000)
    smallPrimes = length(primes(1000))

    solution = 0

    myPrimes = bigPrimes[smallPrimes+1:length(bigPrimes)]


    for i in myPrimes
        counter = 0
        myNumber = zeros(Int, factorial(4))
        for j in permutations(digits(i))
            if isprime(number(j))
                counter += 1
                myNumber[counter] = number(j)
            end
        end

        if counter >= 3
            myNumber = sort!(unique(myNumber))
            while myNumber[1] < 1000
                shift!(myNumber)
            end
            if length(myNumber) >= 3
                for a = 1:(length(myNumber)-2)
                    for b = a+1:(length(myNumber)-1)
                        testedNumber=myNumber[b]+(myNumber[b]-myNumber[a])
                        if in(testedNumber,myNumber)
                            if (myNumber[a] != 1487) && (myNumber[b] != 4817) && (testedNumber != 8147)
                                return solution = 100000000*myNumber[a] + 10000*myNumber[b] + testedNumber
                            end
                        end
                    end
                end
            end
        end

    end

    solution

end

solve049()

#296962999629
