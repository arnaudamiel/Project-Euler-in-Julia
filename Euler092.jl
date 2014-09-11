#= Square digit chains
Problem 92

A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.
 
For example,
 
44 → 32 → 13 → 10 → 1 → 1
85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
 
Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
 
How many starting numbers below ten million will arrive at 89?

=#

using Base.sumabs2

function solve092()

    count = 0

    results = falses(10000000)

    for n = 1:10000000

        newN = sumabs2(digits(n))

        while newN!=1 && newN!=89 && newN>=n
            newN = sumabs2(digits(newN))
        end

        if newN < n
            results[n] = results[newN]
        end

        if newN == 89
            results[n] = true
        end

    end

    sum(results)

end

using Base.Test
@test solve092() == 8581146
