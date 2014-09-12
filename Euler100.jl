#= Arranged probability
Problem 100

If a box contains twenty-one coloured discs, composed of fifteen blue discs and six red discs, and two discs were taken at random, it can be seen that the probability of taking two blue discs, P(BB) = (15/21)×(14/20) = 1/2.
 
The next such arrangement, for which there is exactly 50% chance of taking two blue discs at random, is a box containing eighty-five blue discs and thirty-five red discs.
 
By finding the first arrangement to contain over 10^12 = 1,000,000,000,000 discs in total, determine the number of blue discs that the box would contain.

=#


#= We can find that 2B^2-2B-N^2+N = 0
From the diophantine equation solver there: http://www.alpertron.com.ar/QUAD.HTM
We have:
B(i+1) = 3*B(i) + 2*N(i) - 2
N(i+1) = 4*B(i) + 3*N(i) - 3

=#

function solve100()

    B = 1
    N = 1

    while N < 10^12

        newB = 3*B + 2*N - 2
        N = 4*B + 3*N - 3
        B = newB

    end

    B

end

using Base.Test
@test solve100() == 756872327473
