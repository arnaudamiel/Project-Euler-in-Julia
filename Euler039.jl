#If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
 
#{20,48,52}, {24,45,51}, {30,40,50}
 
#For which value of p 1000, is the number of solutions maximised?

function solve039()

    mySolutions=zeros(1000)

    for p = 1:1000
        for a in 1:p
            for b in a:p
                c = p - a - b
                if (a^2 + b^2 == c^2)
                    mySolutions[p] += 1
                end
            end
        end
    end

    indmax(mySolutions)

end

solve039()

#840
