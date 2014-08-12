#= Problem 53

There are exactly ten ways of selecting three from five, 12345:
 
123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
 
In combinatorics, we use the notation, 5C3 = 10.
 
In general,
 



nCr = n! / r!(n-r)! ,where r<=n, n! = nx(n1)x...x3x2x1, and 0! = 1.
 

It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.
 
How many, not necessarily distinct, values of  nCr, for 1 n 100, are greater than one-million?

=#

function solve053()

    counter = 0

    for i = 1:100
        for j = 1:i
            #We are going to overflow badly here
            try
                if binomial(i,j) > 1000000
                    counter += 1
                end
            #If we overflow, we have a result
            catch
                counter +=1
            end
        end
    end

    counter

end

using Base.Test

@test solve053() == 4075
