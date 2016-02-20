
require "lunit"

module( "point.test", package.seeall, lunit.testcase )

Point = require "Point"

local p1 = nil
local p2 = nil

function setup()
  
  p1 = Point(1,2,3,4,5)
  p2 = Point(1,2,3,4,5)

end

function teardown()

  p1 = nil 
  p2 = nil

end

function test_coordinate_types()
	for k, v in ipairs(p1.coords) do
		assert_equal("number", type(v))
	end
end
function test_adding()
  local ret = Point(2,4,6,8,10)
  assert_true(true, p1+p2==ret)	

end
