#The first two consecutive numbers to have two distinct prime factors are:
 
#14 = 2x7
#15 = 3x5
 
#The first three consecutive numbers to have three distinct prime factors are:
 
#644 = 2^2x7x23
#645 = 3x5x43
#646 = 2x17x19
 
#Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?


function solve047()


    const inArow = 4

    result = 0
    solution = false

    #Start our testing with the product of the first inArow primes
    test = prod(primes(iceil(inArow*(log(inArow)+log(log(inArow)))))[1:inArow])

    while !solution

        #Use steps of inArow to find the right number of factors
        while length(factor(test)) != inArow
            test += inArow
        end

        howMany = 0

        #Look for inArow factors around our candidate
        for i = -(inArow-1):(inArow-1) 
            
            if length(factor(test+i)) == inArow
                howMany += 1
            else
                howMany = 0
            end

            #Do we have a solution yet?
            if howMany == inArow
                solution = true
                result = test + i - (inArow - 1)
            end

        end

        #Try again inArow further
        test += inArow

    end

    #We got there in the end
    result
    
end

solve047()

#134043