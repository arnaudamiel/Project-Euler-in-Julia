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

    inArow = 5
    #We prealocate an array for cubes limited to the size of Int
    #This is way too big but does not take too much memory
    cubes = Array(Int,int(cbrt(typemax(Int))))

    #We will start with 8 digits cubes as we know we need at least that many
    for myDigits = 8:ndigits(typemax(Int))

        #All candidate numbers need the same number of digits
        MIN = ifloor(cbrt(10^(myDigits-1)))
        MAX = iceil(cbrt(10^myDigits - 1))

        #We create an array of cubes with sorted digits
        for i = MIN:MAX
            cubes[i] = number(sort!(digits(i*i*i)))
        end

        #We search the array for identical sorted cubes
        for i = MIN:MAX
            counter = 0
            for j = i:MAX
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

end

using Base.Test

@test solve062() == 127035954683
