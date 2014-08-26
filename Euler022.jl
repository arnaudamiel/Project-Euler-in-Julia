#Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

#For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

#What is the total of all the name scores in the file?

function solve022()

	const ASCIIOffset=int('A'-1)
	rawNames=readcsv("p022_names.txt",String)

	for i in 1:size(rawNames)[2]
		rawNames[i]=strip(rawNames[i],'\"')
	end

	sortedNames=sort(rawNames,2)

	score=Array(Int,size(sortedNames,2))

	result=0
	for i in 1:length(score)
		score[i] = sum(sortedNames[i])-ASCIIOffset*length(sortedNames[i])
		result += score[i]*i
	end

	result
	
end

solve022()

#871198282
