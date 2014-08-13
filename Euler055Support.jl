function Number(n::Array{Int,1})

    counter = 0

    for i = length(n):-1:1
        counter *= 10
        counter += n[i]
    end

    counter

end

function isLychrel(n::Int)

    n = BigInt(n)
    reversedN = BigInt(Number(reverse(digits(n))))

    for i = 1:50

        n += reversedN
        reversedN = BigInt(Number(reverse(digits(n))))

        if n == reversedN
            return false
        end

    end

    true

end
