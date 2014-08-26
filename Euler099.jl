#= Largest exponential
Problem 99

Comparing two numbers written in index form like 2^11 and 3^7 is not difficult, as any calculator would confirm that 2^11 = 2048 < 3^7 = 2187.

However, confirming that 632382^518061 > 519432^525806 would be much more difficult, as both numbers contain over three million digits.

Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file containing one thousand lines with a base/exponent pair on each line, determine which line number has the greatest numerical value.

NOTE: The first two lines in the file represent the numbers in the example given above.

=#
	
function solve099()

	myNumbers=readcsv("p099_base_exp.txt",Int)
	myLogs = Array(Float32,size(myNumbers)[1])
	
	for i = 1:length(myLogs)
		@inbounds myLogs[i] = myNumbers[i,2]*log(myNumbers[i,1])
	end
	
	indmax(myLogs)
end

using Base.Test
@test solve099() == 709
