
require "lunit"

module( "vector.test", package.seeall, lunit.testcase )

Point = require "Point"
KDTree = require "kdtree"

local points = nil
local p1 = nil
local p2 = nil
local v = nil

function setup()
    
    p1 = Point(0,1)
    p2 = Point(0,4)
    local coords = {
	{0,0},
	{0,5}
     }
  
    points = {}
    for k, v in ipairs(coords) do
	table.insert(points, Point(unpack(v)))
    end

end


function test_nearest()
	assert_equal("table", type(points))
	assert_equal(2, #points)
	local tree = KDTree(points)
	local test1 = tree:nearestTo(p1)
	local test2 = tree:nearestTo(p2)

	assert_equal(test1, points[1])
	assert_equal(test2, points[2])
end

