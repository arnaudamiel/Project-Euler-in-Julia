#The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
 
#Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

function solve048()

    mySum::BigInt = 0
    i::BigInt = 0

    for i = 1:1000
        mySum += i^i
    end

    counter = 0
    for i in reverse(digits(mySum)[1:10])
        counter *= 10
        counter += i
    end

    counter

end

solve048()

#9110846700
