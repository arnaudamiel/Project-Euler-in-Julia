#A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

#a2 + b2 = c2
#For example, 32 + 42 = 9 + 16 = 25 = 52.

#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.

function solve009()

	for a in 1:1000
		for b in a:1000
			c = 1000 - a - b
			if (a^2 + b^2 == c^2)
				return(a*b*c)
			end
		end
	end
	
end

solve009()

#31875000