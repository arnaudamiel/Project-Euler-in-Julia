#= Coin partitions

Problem 78

Let p(n) represent the number of different ways in which n coins can be separated into piles. For example, five coins can separated into piles in exactly seven different ways, so p(5)=7.

OOOOO

OOOO   O

OOO   OO

OOO   O   O

OO   OO   O

OO   O   O   O

O   O   O   O   O
 

Find the least value of n for which p(n) is divisible by one million.

=#

#From http://en.wikipedia.org/wiki/Pentagonal_number_theorem

#= Function that calculates the exact value of partitions =#

function Npartitions(n::Int)

    p = Array(BigInt,n+1)
    p[1] = 1

    for i = 1:n
        j = 1
        k = 1
        s = big(0)

        while j > 0

            j = i - div((3 * k*k + k),2)
            if j >= 0
                s -= (-1)^k * p[j+1]
            end

            j = i - div((3 * k*k - k),2)
            if j >= 0
                s -= (-1)^k * p[j+1]
            end

            k += 1

        end

        p[i+1] = s

    end

    p[n+1]

end

function solve078()

    p = Array(Int,1)
    p[1] = 1
    i = 1

    while p[i]%1000000 != 0
        j = 1
        k = 1
        s = 0

        while j > 0

            j = i - div((3 * k*k + k),2)
            if j >= 0
                s = (s - (-1)^k * p[j+1])%1000000
            end

            j = i - div((3 * k*k - k),2)
            if j >= 0
                s = (s - (-1)^k * p[j+1])%1000000
            end

            k += 1

        end

        push!(p,s)
        i += 1

    end

    length(p)-1

end

using Base.Test
@test solve078() == 55374
