#The following iterative sequence is defined for the set of positive integers:

#n → n/2 (n is even)
#n → 3n + 1 (n is odd)

#Using the rule above and starting with 13, we generate the following sequence:

#13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has #not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

#Which starting number, under one million, produces the longest chain?

#NOTE: Once the chain starts the terms are allowed to go above one million.

require("Euler014Support")

function solve014()

	if nprocs()>=2

		a = remotecall(last(procs()), LongestInRange, 1:500000)
		b = remotecall(last(procs())-1, LongestInRange, 500001:1000000)

		first = fetch(a)
		second = fetch(b)
	
		result = (first[2] > second [2]) ? first[1] : second[1]

	else
		result=LongestInRange(1:1000000)[1]
	
	end

	result
	
end

solve014()

#837799