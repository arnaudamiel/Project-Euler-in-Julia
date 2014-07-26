#Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

#21 22 23 24 25
#20  7  8  9 10
#19  6  1  2 11
#18  5  4  3 12
#17 16 15 14 13

#It can be verified that the sum of the numbers on the diagonals is 101.

#What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

function makeSpiral(n::Int)
	
	if iseven(n)
		error("n must be odd")
	end
	
	indexColl= iceil(n/2)
	indexRow=indexColl
	numberInLine=1
	
	myArray=Array(Int,n,n)
	
	currentNumber=1
	
	myArray[indexRow,indexColl]=currentNumber
	currentNumber += 1
	while currentNumber < n*n-n
	
		for i in 1:numberInLine
			indexColl += 1
			myArray[indexRow,indexColl] = currentNumber
			currentNumber += 1
		end
		for i in 1:numberInLine
			indexRow += 1
			myArray[indexRow,indexColl] = currentNumber
			currentNumber += 1
		end
	
		numberInLine += 1
	
		for i in 1:numberInLine
			indexColl -= 1
			myArray[indexRow,indexColl] = currentNumber
			currentNumber += 1
		end
	
		for i in 1:numberInLine
			indexRow -= 1
			myArray[indexRow,indexColl] = currentNumber
			currentNumber += 1
		end
		numberInLine += 1
		
	end
	
	for i = 2:n #n*n-n-1:n*n
		myArray[1,i]=n*n-(n-i)
	end


	myArray
	
end

function solve028()
	n = 1001
	theArray=makeSpiral(n)
	counter = 0
	for i = 1:n
		counter += theArray[i,i]
		counter += theArray[n-(i-1),i]
	end
	
	counter - theArray[iceil(n/2),iceil(n/2)]
end

solve028()