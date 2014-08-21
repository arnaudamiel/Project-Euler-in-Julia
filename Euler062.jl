#= Cubic permutations
Problem 62

The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube which 

has exactly three permutations of its digits which are also cube.
 
Find the smallest cube for which exactly five permutations of its digits are cube.


=#

function number(myDigits::Array{Int})

    counter = myDigits[length(myDigits)]

    for i = length(myDigits)-1:-1:1
        counter *= 10
        counter += myDigits[i]
    end

    counter

end


function solve062()

    MAX = int(cbrt(typemax(Int)))

    inArow = 5

    #We create an array of sorted digits of all the cubes
    #We could speed thinsg up by increasing the array as needed

    cubes = Array(Int,MAX)
    
    for i = 1:MAX
        cubes[i] = number(sort!(digits(i*i*i)))
    end

    #We search the array for identical sorted cubes
    for i = 1:MAX
        counter = 0
        for j = i:((10*i > MAX)?MAX:(10*i)) #We don't need to go further as we would have too many digits
            if cubes[i] == cubes[j]
                counter += 1
            end
        end

        #We found our solution
        if counter == inArow
            return( i*i*i )
        end
    end

end

using Base.Test

@test solve062() == 127035954683
