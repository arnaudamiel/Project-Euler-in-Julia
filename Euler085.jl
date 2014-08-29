#=Counting rectangles
Problem 85

By counting carefully it can be seen that a rectangular grid measuring 3 by 2 contains eighteen rectangles:

Although there exists no rectangular grid that contains exactly two million rectangles, find the area of the grid with the nearest solution.

=#

function solve085()

    limit = 2000000
    minDif = 2000000

    area = 4

    for x = 2:100
        for y = x:100

            difference = abs(div(x*(x+1) * y*(y+1), 4) - limit)

            if difference < minDif
                area = x*y
                minDif = difference
            end
        end
    end

    area

end

using Base.Test
@test solve085() == 2772