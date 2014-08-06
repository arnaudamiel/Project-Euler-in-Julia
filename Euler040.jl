#An irrational decimal fraction is created by concatenating the positive integers:
 
#0.123456789101112131415161718192021...
 
#It can be seen that the 12th digit of the fractional part is 1.
 
#If dn represents the nth digit of the fractional part, find the value of the following expression.
 
#d1xd10xd100xd1000xd10000xd100000xd1000000


function solve040()

    Champernowne = Array(Int,0)
    sizehint(Champernowne,2000000)

    number = 1

        while length(Champernowne) < 1000000
            append!(Champernowne,reverse!(digits(number)))
            number += 1
        end

    Champernowne[1]*Champernowne[10]*Champernowne[100]*Champernowne[1000]*Champernowne[10000]*Champernowne[100000]*Champernowne[1000000]



end

solve040()

#210
