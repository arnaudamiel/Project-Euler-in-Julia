#In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
 
#1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
 
#It is possible to make £2 in the following way:
 
#1x£1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
 
#How many different ways can £2 be made using any number of coins?


function solve031()

    target = 200
    coins = [ 1, 2, 5, 10, 20, 50, 100, 200 ]
    ways = zeros(Int,target+1)

    ways[1] = 1 #1 way of paying 0p with 1p coins

    for i in coins
        for j = i:target
            ways[j+1] += ways[j+1 - i];
        end
    end

    ways[target+1]

end

solve031()

#73682
