--[[

#########################################################################
#                                                                       #
# polygon.test.lua                                                      #
#                                                                       #
# Polygon test class                                                   #
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

module( "polygon.test", package.seeall, lunit.testcase )

Point = require "Point"
Polygon = require "Polygon"
KDTree = require "kdtree"

local test1 = nil
local test2 = nil

function setup()
	for i = 4, 30 do
		local poly = Polygon();
		poly:addPoint(0,0)
		poly:addPoint(0,i)
		poly:addPoint(i,i)
		poly:addPoint(i,0)
	end

end


function test_nearest()
	--[[local points = Polygon.calculateAllCentroids()
	for k, v in pairs(points) do
		print('POINT: ', unpack(v.coords))
	end

	local tree = KDTree(points)
	local polys = {}
	local searchTo = Point(15, 15)
	local p = tree:nearestTo(searchTo, function(lNorm, rNorm, node)
		local poly = node.point.polygon
		if poly:contains(searchTo) then
			table.insert(polys, poly)
		end
		return lNorm < rNorm
	end)

	--tree:print();
	print("Matching polygons = "..#polys)
	print("Nearest = ", unpack(p.coords))]]

end

function test_on_one_axis()
	Polygon.polygons = {}
	local CONQUERIA = Polygon()
	CONQUERIA:addPoint(1528, 1547)
	CONQUERIA:addPoint(1537, 1547)
	CONQUERIA:addPoint(1537, 1557)
	CONQUERIA:addPoint(1528, 1557)
	CONQUERIA.sound = "Fairy Tail - Main.ogg"
	CONQUERIA.fadeIn = 3
	CONQUERIA.priority = 1
	CONQUERIA:normalize()

	for i = 1, 10 do
		local CONQUERIA2 = CONQUERIA:move(0,30*i)
		CONQUERIA2.sound = "Fairy Tail - Main.ogg"
		CONQUERIA2.priority = 1
		CONQUERIA2.fadeIn = 3
	end

	local points = Polygon.calculateAllCentroids()
	local tree = KDTree(points)
	tree:print()
	local searchTo = Point(1533, 1554)
	local polys = {}
	local p = tree:nearestTo(searchTo, function(lNorm, rNorm, node)
		local poly = node.point.polygon
		print("Visited:", unpack(node.point.coords))
		if poly:contains(searchTo) then
			table.insert(polys, poly)
		end
		return lNorm < rNorm
	end)
	print("Closest:", unpack(p.coords))
	print("Zones:" .. #polys)

end

