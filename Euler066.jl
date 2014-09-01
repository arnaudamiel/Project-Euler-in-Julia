#= Diophantine equation
Problem 66

Consider quadratic Diophantine equations of the form:
 
x2 – Dy2 = 1
 
For example, when D=13, the minimal solution in x is 6492 – 13×1802 = 1.
 
It can be assumed that there are no solutions in positive integers when D is square.
 
By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the following:
 
32 – 2×22 = 1
22 – 3×12 = 1
92 – 5×42 = 1
52 – 6×22 = 1
82 – 7×32 = 1
 
Hence, by considering minimal solutions in x for D ≤ 7, the largest x is obtained when D=5.
 
Find the value of D ≤ 1000 in minimal solutions of x for which the largest value of x is obtained.

=#

#From http://en.wikipedia.org/wiki/Chakravala_method

function Pell(D::Int)
    p = BigInt(1)
    k = BigInt(1)
    x1 = BigInt(1)
    x = BigInt(0)
    y = BigInt(0)

    while (k != 1) || (y == 0)
        p = k * div(p,k+1) - p
        p = p - ifloor((p - sqrt(D))/k) * k
        x = div((p*x1 + D*y) , abs(k))
        y = div((p*y + x1) , abs(k))
        k = div((p*p - D) , k)
        x1 = x
    end

    x
end

function solve066()

    solution = 0
    maxD = 0

    for D in primes(1000)

        ThisSolution = Pell(D)

        if ThisSolution > solution
            solution = ThisSolution
            maxD = D
        end
    end

    maxD

end

using Base.Test
@test solve066() == 661
