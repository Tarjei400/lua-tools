Point = require "Point"

p1 = Point(1,2,3,4,5)
p2 = Point(1,2,3,4,5)
p3 = p1 + p2
p4 = p1*2
print("Are equal?" .. tostring(p1==p4))
