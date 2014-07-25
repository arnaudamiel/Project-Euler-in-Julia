#Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.

function solve013()
	MyNumbers=readcsv("Euler013.csv",BigInt)
	BigInt(string(sum(MyNumbers))[1:10])
end

solve013()

#5537376230