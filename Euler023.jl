#A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

#A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

#As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

#Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

const maxAbundant = 28123

function sumOfDivisors(n::Int)
  f = factor(n)
  counter = 1
  for i in keys(f)
    count = 1
    for j = 1:f[i]
	  count += i^j
	end
	counter *= count
  end
  counter-n
 end
 
function isAbundant(n::Int)
  sumOfDivisors(n) > n ? true : false
end  

function solve23()
	abundantNumbers=Array(Int,1)
 
	abundantNumbers[1]=12
	sizehint(abundantNumbers, maxAbundant)
 
	for i = 13:maxAbundant
		if isAbundant(i)
			push!(abundantNumbers, i)
		end
	end

	isSumOfAbundant=falses(1,maxAbundant)

	for i = 1:length(abundantNumbers)
		for j = i:length(abundantNumbers)
			SumOfAbundant = abundantNumbers[i] + abundantNumbers[j]
			if SumOfAbundant <= maxAbundant
				isSumOfAbundant[SumOfAbundant]=true
			else
				break
			end
		end
	end


	result=0
	for i = 1:maxAbundant
		if !isSumOfAbundant[i]
			result += i
		end
	end

	result
end

solve23()
#4179871