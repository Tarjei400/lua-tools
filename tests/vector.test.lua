
require "lunit"

module( "vector.test", package.seeall, lunit.testcase )

Point = require "Point"
Vector = require "Vector"

local p1 = nil
local p2 = nil
local v = nil
function setup()
  
  p1 = Point(0,0)
  p2 = Point(3,4)
  v = Vector(p1, p2)
end

function teardown()

  p1 = nil 
  p2 = nil
  v = nil
end

function test_norm()
	assert_equal(5, v:norm())
end

