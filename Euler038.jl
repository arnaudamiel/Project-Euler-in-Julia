#Take the number 192 and multiply it by each of 1, 2, and 3:
 
#192x1 = 192
#192x2 = 384
#192x3 = 576
 
#By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
 
#The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
 
#What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n 1?

function number(theDigits)
    counter = 0
    for i = length(theDigits):-1:1
        counter *= 10
        counter += theDigits[i]
    end
    counter
end

function isPandigital(n::Int)

    sort!(digits(n)) == [1:length(digits(n))]

end

function solve038()

    for i = 9876:-1:9123

       theNumber = number([digits(2*i),digits(i)])

        if isPandigital(theNumber)

            return(theNumber)
        end
    end

end

solve038()

#932718654
