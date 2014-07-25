#A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

#1/2	= 	0.5
#1/3	= 	0.(3)
#1/4	= 	0.25
#1/5	= 	0.2
#1/6	= 	0.1(6)
#1/7	= 	0.(142857)
#1/8	= 	0.125
#1/9	= 	0.(1)
#1/10	= 	0.1
#Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

#Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

function factors(n)
    f = [one(n)]
    for (p,e) in factor(n)
        f = reduce(vcat, f, [f*p^j for j in 1:e])
    end
    return length(f) == 1 ? [one(n), n] : sort!(f)
end
 
function multiplicativeOrder(base, m)

    if gcd(base,m) != 1
		error("$a and $m are not coprime")
	end
	
    result = one(m)
	
    for (p,e) in factor(m)
        m = p^e
        t = div(m, p) * (p-1)        
        for f in factors(t)
            if powermod(base, f, m) == 1
                result = lcm(result, f)
                break
            end
        end
    end
	
    result
	
end

function solve026()
	allPrimes = primes(1000)
	reverse!(allPrimes)

	for i in allPrimes
		if multiplicativeOrder(10,i) == i-1
			return i
		end
	end

end

solve026()

#983

