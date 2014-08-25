#= Maximum path sum II
Problem 67

By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.

NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 299 altogether! If you could check one trillion (1012) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)

=#

function solve067()

	text=readlines(open("p067_triangle.txt"))
	NomberOfRows=length(text)
	data=Array(Int,NomberOfRows,NomberOfRows)

	for i in 1:NomberOfRows
		for j in 1:i
			data[i,j]=int(split(text[i])[j])
		end
	end

	for i in 1:(NomberOfRows-1)
		row=NomberOfRows-i
		for j in 1:row
			data[row,j] += maximum([data[row+1,j],data[row+1,j+1]])
		end
	end

	data[1,1]

end

using Base.Test
@test solve067() == 7273
