#=Problem 52

It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
 
Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

=#

function solve052()
    Number = 0

    foundResult = false

    while !foundResult

        Number += 1
        foundResult = sort(digits(Number))==sort(digits(2*Number))==sort(digits(3*Number))==sort(digits(4*Number))==sort(digits(5*Number))==sort(digits(6*Number))

    end

    Number
end

solve052()

#142857
