--[[

#########################################################################
#                                                                       #
# kdtree.test.lua                                                       #
#                                                                       #
# Generic KDTree test class                                             #
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

module( "kdtree.test", package.seeall, lunit.testcase )

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
	local tree = KDTree(points)
	
	assert_equal(2, #tree.root.point.coords)
	assert_equal("table", type(points))
	assert_equal(2, #points)
	
	tree:print();
	
	local test1 = tree:nearestTo(p1)
	local test2 = tree:nearestTo(p2)
	
	assert_equal(test1, points[1])
	assert_equal(test2, points[2])
end

