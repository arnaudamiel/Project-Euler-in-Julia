#Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
#If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

#For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

#Evaluate the sum of all the amicable numbers under 10000.

function sumOfDivisors(n::Int)
  f=factor(n)
  counter::Int=1
  for i in keys(f)
    count::Int=1
    for j in 1:f[i]
	  count +=i^j
	end
	counter *=count
  end
  counter-n
end
	  
  

function isAmicable(n::Int)
  s=sumOfDivisors(n)
  if s==n
	return false
  end
  if (sumOfDivisors(s)==n)
    return true
  else
    return false
  end
end

function solve021()

	counter=0

	for i in 2:10000
		if (isAmicable(i))
			counter +=i
		end
	end

	counter  

end

solve021()

#31626