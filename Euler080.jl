#= Square root digital expansion
Problem 80

It is well known that if the square root of a natural number is not an integer, then it is irrational. The decimal expansion of such square roots is infinite without any repeating pattern at all.

The square root of two is 1.41421356237309504880..., and the digital sum of the first one hundred decimal digits is 475.

For the first one hundred natural numbers, find the total of the digital sums of the first one hundred decimal digits for all the irrational square roots.

=#

function solve080()

    counter = 0
    
    with_bigfloat_precision(iceil(3.33*100)) do
    
    	for n = 1:100
    		number = sqrt(BigFloat(n))
    		if !isinteger(number)
    		    for i = 1:100
    		    	counter += ifloor(number)
    		        number -= ifloor(number)
    		        number *=10
    		    end
    		end
    	end
    
    end
    
    counter

end

using Base.Test
@test solve080() == 40884
