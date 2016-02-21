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

local test1 = nil
local test2 = nil
function setup()
    
    p1 = Point(0,1)
    p2 = Point(0,4)
    local coords = {
	{0,0},
	{0,5},
	{0,10},
	{15,9},
	{15,0},
     }
  
    points = {}
    for k, v in ipairs(coords) do
		table.insert(points, Point(unpack(v)))
	end

	check1 = points[1]
	check2 = points[2]

end


function test_nearest()
	local tree = KDTree(points)
	tree:print();


	assert_equal(2, #tree.root.point.coords)
	assert_equal("table", type(points))
	assert_equal(5, #points)
	

	local test1 = tree:nearestTo(p1)
	local test2 = tree:nearestTo(p2)

	assert_equal(test1, check1)
	assert_equal(test2, check2)
end

function test_dense_grid_test_nearest()
	local points ={}
	for x = 0, 100 do
			for y = 0, 100 do
				table.insert(points, Point(x,y))
			end
	end

	local tree = KDTree(points);
	local nearest = tree:nearestTo(Point(-1,7))
	assert_equal(Point(0,7), nearest)
end