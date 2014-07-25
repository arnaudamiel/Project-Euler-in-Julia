#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

#Find the largest palindrome made from the product of two 3-digit numbers.

function solve004()

	maxN=0

	for a in 1:999
		for b in a:999
			number = a*b
			numbers = digits(number)
			if numbers == reverse(numbers)
				if maxN < number
					maxN = number
				end
			end
		end
	end

	maxN

end

solve004()

#906609