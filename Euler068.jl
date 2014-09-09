#= Magic 5-gon ring
Problem 68

Consider the following "magic" 3-gon ring, filled with the numbers 1 to 6, and each line adding to nine.

Working clockwise, and starting from the group of three with the numerically lowest external node (4,3,2 in this example), each solution can be described 

uniquely. For example, the above solution can be described by the set: 4,3,2; 6,2,1; 5,1,3.
 
It is possible to complete the ring with four different totals: 9, 10, 11, and 12. There are eight solutions in total.

Total	Solution Set

9	4,2,3; 5,3,1; 6,1,2
9	4,3,2; 6,2,1; 5,1,3
10	2,3,5; 4,5,1; 6,1,3
10	2,5,3; 6,3,1; 4,1,5
11	1,4,6; 3,6,2; 5,2,4
11	1,6,4; 5,4,2; 3,2,6
12	1,5,6; 2,6,4; 3,4,5
12	1,6,5; 3,5,4; 2,4,6

By concatenating each group it is possible to form 9-digit strings; the maximum string for a 3-gon ring is 432621513.
 
Using the numbers 1 to 10, and depending on arrangements, it is possible to form 16- and 17-digit strings. What is the maximum 16-digit string for a "magic" 

5-gon ring?

=#

function solve068()

    result = Array(Int,10)
    solution = 0

    for myNumbers in permutations([1:10])

        mySum = sum(myNumbers[1:3])
        if (mySum == myNumbers[4]+myNumbers[3]+myNumbers[5]) && (mySum == myNumbers[6]+myNumbers[5]+myNumbers[7]) && (mySum == myNumbers[8]+myNumbers[7]+myNumbers[9]) && (mySum == myNumbers[10]+myNumbers[9]+myNumbers[2])

            if (myNumbers[1] < myNumbers[4]) && (myNumbers[1] < myNumbers[6]) && (myNumbers[1] < myNumbers[8]) && (myNumbers[1] < myNumbers[10])

                myNumber = 0

                for i in [myNumbers[1],myNumbers[2],myNumbers[3],myNumbers[4],myNumbers[3],myNumbers[5],myNumbers[6],myNumbers[5],myNumbers[7],myNumbers[8],myNumbers[7],myNumbers[9],myNumbers[10],myNumbers[9],myNumbers[2]]
                    myNumber *= 10

                    if i == 10
                        myNumber *= 10
                    end

                    myNumber += i
                end

                if (ndigits(myNumber) == 16) && (myNumber > solution)
                    solution = myNumber
                end

            end

        end

    end

    solution

end

using Base.Test
@test solve068() == 6531031914842725
