spelling = [
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    15 => "fifteen",
    18 => "eighteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety", 
  1000 => "one thousand" ]

function spell(n)
    if (haskey(spelling,n))
			return spelling[n]
	end
	if (n >= 100)
			return string(spell( div(n,100) )," hundred", n % 100 == 0 ? "" : string(" and ",spell( n % 100 )) )
	end
    if (n >= 20)
			return string(spell( div(n,10) * 10 ), n % 10 == 0 ? "" : string("-",spell( n % 10 )) )
	end
    return string(spell( n % 10 ),"teen")
end

function solve017()

	sum( [ length(replace(spell(i),Set('-',' '),"")) for i in 1:1000 ])

end

solve017()

#21124