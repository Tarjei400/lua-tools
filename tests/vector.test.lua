--[[

#########################################################################
#                                                                       #
# vector.test.lua                                                       #
#                                                                       #
# Generic Vector test class                                             #
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


function test_norm()
	assert_equal(5, v:norm())
end

