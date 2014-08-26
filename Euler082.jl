#=Path sum: three ways
Problem 82

NOTE: This problem is a more challenging version of Problem 81.

The minimal path sum in the 5 by 5 matrix below, by starting in any cell in the left column and finishing in any cell in the right column, and only moving up, down, and right, is indicated in red and bold; the sum is equal to 994.


131	673	234	103	18
201	96	342	965	150
630	803	746	422	111
537	699	497	121	956
805	732	524	37	331

Find the minimal path sum, in matrix.txt (right click and 'Save Link/Target As...'), a 31K text file containing a 80 by 80 matrix, from the left column to the right column.

=#

function solve082()

	myMatrix = readcsv("p082_matrix.txt",Int)
	myLength = size(myMatrix)[1]
	
	myColumn = myMatrix[:,myLength]
	
	for i = myLength-1:-1:1
		myColumn[1] += myMatrix[1,i]
		
		for j = 2:myLength
			myColumn[j] = minimum([(myColumn[j-1]+myMatrix[j,i]),(myColumn[j]+myMatrix[j,i])])
		end
		
		for j = myLength-1:-1:1
			myColumn[j] = minimum([(myColumn[j]),(myColumn[j+1]+myMatrix[j,i])])
		end
	end
		
	minimum(myColumn)

end

using Base.Test
@test solve082() == 260324
