#= Almost equilateral triangles
Problem 94
 

It is easily proved that no equilateral triangle exists with integral length sides and integral area. However, the almost equilateral triangle 5-5-6 has an area of 12 square units.
 
We shall define an almost equilateral triangle to be a triangle for which two sides are equal and the third differs by no more than one unit.
 
Find the sum of the perimeters of all almost equilateral triangles with integral side lengths and area and whose perimeters do not exceed one billion (1,000,000,000).

=#

#From: http://en.wikipedia.org/wiki/Heronian_triangle#Almost-equilateral_Heronian_triangles

function solve094()

    oldSide = 1
    oldOldSide = 1
    side = 1
    counter = 0
    perimeter = 0
    error = 1

    while perimeter < 1000000000

	counter += perimeter

        oldOldSide = oldSide
        oldSide = side
        side = 4*side - oldOldSide + 2*error
        error = -error

        perimeter = 3*side - error
        
    end

    counter

end

using Base.Test
@test solve094() == 518408346
