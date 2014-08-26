#=Path sum: two ways
Problem 81
In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by only moving to the right and down, is indicated in bold red and is equal to 2427.


131	673	234	103	18
201	96	342	965	150
630	803	746	422	111
537	699	497	121	956
805	732	524	37	331

Find the minimal path sum, in matrix.txt (right click and 'Save Link/Target As...'), a 31K text file containing a 80 by 80 matrix, from the top left to the bottom right by only moving right and down.

=#

function solve081()

	myMatrix = readcsv("p081_matrix.txt",Int)
	myLength = size(myMatrix)[1]
	
	for i = myLength-1:-1:1
		myMatrix[myLength,i] += myMatrix[myLength, i+1]
		myMatrix[i,myLength] += myMatrix[i+1, myLength]
	end
	
	for i = myLength-1:-1:1
		for j = myLength-1:-1:1
			@inbounds myMatrix[i,j] += minimum([myMatrix[i+1,j],myMatrix[i,j+1]])
		end
	end
	
	myMatrix[1,1]

end

using Base.Test
@test solve081() == 427337
