#The decimal number, 585 = 1001001001(2) (binary), is palindromic in both bases.
 
#Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
 
#(Please note that the palindromic number, in either base, may not include leading zeros.)



function solve036()

counter = 0

for i = 1:1000000
    if (dec(i) == reverse(dec(i))) && (bin(i) == reverse(bin(i)))
        counter += i
        #println(i)
    end
end

counter

    

end

solve036()

#872187
