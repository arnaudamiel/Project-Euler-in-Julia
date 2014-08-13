#= Square root convergents
Problem 57

It is possible to show that the square root of two can be expressed as an infinite continued fraction.
 
sqrt(2) = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
 
By expanding this for the first four iterations, we get:
 
1 + 1/2 = 3/2 = 1.5
 1 + 1/(2 + 1/2) = 7/5 = 1.4
 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

 
The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.
 
In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?


=#

#http://en.wikipedia.org/wiki/Square_root_of_2#Continued_fraction_representation
#The convergent p/q differs from the square root of 2 by almost exactly [citation needed] and then the next convergent is (p + 2q)/(p + q).

function solve057()

    counter = 0
    numerator::BigInt = 1
    denominator::BigInt = 1

    for i = 1:1000
        
        numerator += 2*denominator
        denominator = numerator - denominator

        if ndigits(numerator)>ndigits(denominator)
            counter += 1
        end

    end

    counter        

end

using Base.Test

@test solve057() == 153