function phi(n::Int)

    counter = n

    for p in keys(factor(n))
        counter *= 1 -1/p
    end

    counter

end
