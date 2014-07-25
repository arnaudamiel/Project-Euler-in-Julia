#The Fibonacci sequence is defined by the recurrence relation:

#Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
#Hence the first 12 terms will be:

#F1 = 1
#F2 = 1
#F3 = 2
#F4 = 3
#F5 = 5
#F6 = 8
#F7 = 13
#F8 = 21
#F9 = 34
#F10 = 55
#F11 = 89
#F12 = 144
#The 12th term, F12, is the first term to contain three digits.

#What is the first term in the Fibonacci sequence to contain 1000 digits?

function solve025()
	limit = BigInt(10)^BigInt(999)

	sequence = Array(BigInt,3,1)
	sequence[1]=BigInt(1)
	sequence[2]=BigInt(1)
	sequence[3] = sequence[1] + sequence[2]

	counter = 2

	while (sequence[3] <= limit)
		counter +=1
		sequence[3] = sequence[1] + sequence[2]
		sequence[1]=sequence[2]
		sequence[2]=sequence[3]
	end

	counter
	#using Base.Test
	#@test counter == 4782
	
end

solve025()

#4782
