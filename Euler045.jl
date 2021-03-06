#Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:
 
#Triangle Tn=n(n+1)/2
#1, 3, 6, 10, 15, ...
 
#Pentagonal Pn=n(3n-1)/2
#1, 5, 12, 22, 35, ...

#Hexagonal Hn=n(2n-1)
#1, 6, 15, 28, 45, ...
 
#It can be verified that T285 = P165 = H143 = 40755.
 
#Find the next triangle number that is also pentagonal and hexagonal.



function Hn(n::Int)

    n*(2*n - 1)

end

function isTriangular(n::Int)

    isinteger(sqrt(8*n+1))

end


function isPentagonal(n::Int)

    isinteger((sqrt(24*n+1)+1)/6)

end

function solve045()

    n = 144

    while !( isTriangular(Hn(n)) && isPentagonal(Hn(n)) )
        n +=1
    end

    Hn(n)   

end

solve045()


#1533776805