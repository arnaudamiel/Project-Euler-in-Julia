#We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

#The product 7254 is unusual, as the identity, 39x186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

#Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

#HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.


#This is the inverse function of digits()
function number(setOfDigits)

    n=0

    for i =1:length(setOfDigits)
        n *= 10
        n += setOfDigits[i]
    end

    n
end

function solve032()
    result = Array(Int,0)

    for myDigits in permutations([1:9])

        if myDigits[1] * number(myDigits[2:5]) == number(myDigits[6:9])
            push!(result,number(myDigits[6:9]))
            #println("$(myDigits[1]) * $(number(myDigits[2:5])) = $(number(myDigits[6:9]))")
        end

        if number(myDigits[1:2]) * number(myDigits[3:5]) == number(myDigits[6:9])
            push!(result,number(myDigits[6:9]))
            #println("$(number(myDigits[1:2])) * $(number(myDigits[3:5])) = $(number(myDigits[6:9]))")
        end

    end

    sum(unique(result))

end

solve032()

#45228
