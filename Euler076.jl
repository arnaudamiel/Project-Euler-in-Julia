#= Counting summations
Problem 76

It is possible to write five as a sum in exactly six different ways:
 
4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1
 
How many different ways can one hundred be written as a sum of at least two positive integers?

=#

function solve076()

    length(partitions(100))-1


end

using Base.Test
@test solve076() == 190569291