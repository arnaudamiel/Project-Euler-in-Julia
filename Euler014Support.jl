#This file helps for dual processor
#Functions are sent to each process

function CollatzLength(n)
    i::Uint=1
	value::Uint64 = n
	
	while value!=1
		iseven(value) ? (value/=2) : (value=3*value+1)
		i+=1
	end
	i
end

function LongestInRange(R)

	LongestChain::Uint=0
	LongestChainNumber::Int=0
	
	for j::Uint in R
		CurrentLenght=CollatzLength(j)
		if (CurrentLenght > LongestChain)
			LongestChain = CurrentLenght
			LongestChainNumber = j
		end
	end
	LongestChainNumber,LongestChain
end