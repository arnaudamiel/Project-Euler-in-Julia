#= Powerful digit sum
Problem 56

A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
 
Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?

=#

function solve056()

    maxSum = 0

    for a::BigInt = 1:100
        for b = 1:100
            theSum = sum(digits(a^b))
            if theSum > maxSum
                maxSum = theSum
            end
        end
    end

    maxSum        

end

using Base.Test

@test solve056() == 972