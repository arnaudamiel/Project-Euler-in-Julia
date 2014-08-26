#= Prime summations
Problem 77

It is possible to write ten as the sum of primes in exactly five different ways:

7 + 3
5 + 5
5 + 3 + 2
3 + 3 + 2 + 2
2 + 2 + 2 + 2 + 2

What is the first value which can be written as the sum of primes in over five thousand different ways?

=#

function solve077()

    target = 2
    myPrimes = primes(1000)
    found = false
    
    while !found
    	ways = zeros(Int,target+1)

   		ways[1] = 1 #Initialised there is one way to write 1
   	 	for i in myPrimes
        	for j = i:target
            	ways[j+1] += ways[j+1 - i];
        	end
    	end

    	if ways[target+1] > 5000
    		found = true
    	end
    	
    	target += 1
    end
    
    target - 1

end

using Base.Test
@test solve077() == 71
