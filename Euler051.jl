#By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
 
#By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.
 
#Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

##########################

#To make an 8 prime value family, the repeated digit in the smallest prime of the familly will be 0,1 or 2 as we need at least an other 7 numbers.

#The last digit can't be repeated as we would have even numbers

#Because our number can not be divided by 3 it needs 3 repeating digits and the sum of the non repeating digits must not be divisible by 3

#Let's check if we can have an answer for 5 digits, either a***b or *a**b or **a*b or ***ab


#=
function test5()

    for a = 0:9
        for b = 1:2:9
            counter = 0
            for myDigit = 0:9
                theNumber = 10000*a + 1110*myDigit + b
                if isprime(theNumber)
                    counter += 1
                end
            end
            if counter >= 8
                println(theNumber)
            end

            counter = 0
            for myDigit = 0:9
                theNumber = 1000*a + 10110*myDigit + b
                if isprime(theNumber)
                    counter += 1
                end
            end
            if counter >= 8
                println(theNumber)
            end

            counter = 0
            for myDigit = 0:9
                theNumber = 100*a + 11010*myDigit + b
                if isprime(theNumber)
                    counter += 1
                end
            end
            if counter >= 8
                println(theNumber)
            end

            counter = 0
            for myDigit = 0:9
                theNumber = 10*a + 11100*myDigit + b
                if isprime(theNumber)
                    counter += 1
                end
            end
            if counter >= 8
                println(theNumber)
            end

        end
     end
end

@time test5()

elapsed time: 0.046800064 seconds (1257096 bytes allocated)

=#

#So no 5 digits solution

#Let's check for 6 digits

function makeNumber(t,d,c)
    counter = 0
    for i in 1:length(t)
        counter *= 10
        counter += (t[i]==11)?d:t[i]
    end
    counter *= 10
    counter += c
end

function solve051()

    solution = 999999

    for a = 0:9
        for b = 0:9
            for c = 1:2:9
                for i in permutations([ a b 11 11 11 ])
                    counter = 0
                    for d = 0:9
                        theNumber = makeNumber(i,d,c)
                        if isprime(theNumber) && theNumber > 100000
                            counter += 1
                        end
                    end
                    if counter >=8
                        for d = 0:9
                            theNumber = makeNumber(i,d,c)
                            if isprime(theNumber) && theNumber > 100000 && theNumber < solution
                                solution = theNumber
                            end
                        end                        
                    end
                end
            end
        end
    end

    solution

end

solve051()

#121313
