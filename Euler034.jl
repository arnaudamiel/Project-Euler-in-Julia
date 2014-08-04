Enter file contents here#145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
 
#Find the sum of all numbers which are equal to the sum of the factorial of their digits.
 
#Note: as 1! = 1 and 2! = 2 are not sums they are not included.


function sumFactorialDigits(n::Int)

    mySum = 0

    for i in digits(n)
        mySum += factorial(i)
    end

    mySum

end

function solve034()

    i = 1

    while ndigits(i*factorial(9)) < i
        i += 1
    end

    result = 0 
    for i = 3:(i*factorial(9))
        if sumFactorialDigits(i) == i
            result += i
        end
    end

    result

end

solve034()

#40730
