#= Right triangles with integer coordinates
Problem 91

The points P(x1, y1) and Q(x2, y2) are plotted at integer co-ordinates and are joined to the origin, O(0,0), to form ΔOPQ.


 ^
 |   P
 |  /\
 | /  \Q
 |/
O------->
 

There are exactly fourteen triangles containing a right angle that can be formed when each co-ordinate lies between 0 and 2 inclusive; that is, 0 ≤ x1, y1, x2, y2 ≤ 2.

[Diagram of all triangles] 

Given that 0 ≤ x1, y1, x2, y2 ≤ 50, how many right triangles can be formed?

=#

function solve091()

    count = 0

    for x1 = 0:50, y2 = 0:50, x2 = x1:50, y1 = y2:50
        if (y1!=0) && (x2!=0)

            l1 = sumabs2([x1,y1])
            l2 = sumabs2([(x2-x1),(y2-y1)])
            l3 = sumabs2([x2,y2])

            if l2!=0
                if l1+l2==l3 || l2+l3==l1 || l1+l3==l2
                    count += 1
                end
            end

        end
    end

    count

end

using Base.Test
@test solve091()== 14234
