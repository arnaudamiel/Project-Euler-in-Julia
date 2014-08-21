#= Powerful digit counts
Problem 63

The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number, 134217728=8^9, is a ninth power.
 
How many n-digit positive integers exist which are also an nth power?

=#

#If we call our number a^b it is easy to show that a is 0:9 to prevent too many numbers
#b has to be such that b <= 1/(1-log10(a)) to have enough numbers

function solve063()

    counter = 0

    for a = 0:9
        counter += ifloor(1/(1-log10(a)))
    end

    counter

end

using Base.Test

@test solve063() == 49
