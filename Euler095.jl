#= Amicable chains
Problem 95

The proper divisors of a number are all the divisors excluding the number itself. For example, the proper divisors of 28 are 1, 2, 4, 7, and 14. As the sum of these divisors is equal to 28, we call it a perfect number.
 
Interestingly the sum of the proper divisors of 220 is 284 and the sum of the proper divisors of 284 is 220, forming a chain of two numbers. For this reason, 220 and 284 are called an amicable pair.
 
Perhaps less well known are longer chains. For example, starting with 12496, we form a chain of five numbers:
 
12496 → 14288 → 15472 → 14536 → 14264 (→ 12496 → ...)
 
Since this chain returns to its starting point, it is called an amicable chain.
 
Find the smallest member of the longest amicable chain with no element exceeding one million.

=#

function sumOfDivisors(n::Int)

    if n == 1
        return 1
    end

    f=factor(n)

    counter::Int=1

    for i in keys(f)

        count::Int=1

        for j in 1:f[i]
	    count +=i^j
	end
	counter *=count
    end

    counter-n

end
	

function solve095()

    result = 0
    longest = 0
    myChain = Array(Int,1000000)
    sumDiv = Array(Int,1000000)

    for i = 1:1000000
        sumDiv[i] = sumOfDivisors(i)
    end
    
    for n = 1:1000000

        myChain[1] = n
        index = 1

        newNumber = sumDiv[n]

        while !in(newNumber,myChain[1:index]) && newNumber<=1000000 && newNumber!=1
            index +=1
            myChain[index] = newNumber
            newNumber = sumDiv[newNumber]
        end  

        if newNumber == n && index>longest
            longest = index
            result = minimum(myChain[1:index])
        end

    end

    result

end

using Base.Test
@test solve095() == 14316
