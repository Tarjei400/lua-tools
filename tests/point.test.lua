--[[

#########################################################################
#                                                                       #
# point.test.lua                                                        #
#                                                                       #
# Generic Point test class                                              #
#                                                                       #
# Copyright 2016 Adrian Jutrowski                                       #
# adrian.jutrowski@gmail.com                                            #
# 			                                                            #
#                                                                       #
# This program is free software: you can redistribute it and/or modify  #
# it under the terms of the GNU General Public License as published by  #
# the Free Software Foundation, either version 3 of the License, or     #
# (at your option) any later version.                                   #
#                                                                       #
# This program is distributed in the hope that it will be useful,       #
# but WITHOUT ANY WARRANTY; without even the implied warranty of        #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         #
# GNU General Public License <http://www.gnu.org/licenses/> for         #
# more details.                                                         #
#                                                                       #
#########################################################################

--]]

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
function test_coordinate_gettypes()
	assert_equal(1,p1:get(1))
	assert_equal(2,p1:get(2))
	assert_equal(3,p1:get(3))
	assert_equal(4,p1:get(4))
	assert_equal(5,p1:get(5))
end
function test_coordinate_types()
	for k, v in ipairs(p1.coords) do
		assert_equal("number", type(v))
	end
end
function test_adding()
  local ret = Point(2,4,6,8,10)
  assert_equal( p1+p2, ret)	

end

function test_multiplication()
  assert_equal(p1 + p2, p1*2)
  
end

function test_division()
  local ret = Point(2,4,6,8,10)
  assert_equal(p1, (p1*2)/2)
end
