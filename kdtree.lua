--[[

#########################################################################
#                                                                       #
# polygon.lua                                                           #
#                                                                       #
# Generic KDTree class                                               #
#                                                                       #
# Copyright 2016 Adrian Jutrowski                                       #
# adrian.jutrowski@gmail.com                                            #
# 			                                                #
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

Class = require "class"
Point = require "Point"

local function subset(t, from, to)
	local ret = {}
	for i = from, to do
		table.insert(ret, t[i])
	end
	return ret
end
local Node = Class.create()
Node.initialize= function(point, left, right, depth)
	self.point = point
	self.left = left
	self.right = right
	self.depth = depth
end
local KDTree = Class.create()
KDTree.initialize = function(points, depth)
	depth = depth ~= nil and depth or 1
	local k = points[1]:dimention()
	
	if #points == 1 then
		return Node( points[1], nil, nil, depth)
	end
	--Select axis, sort points
	local axis = depth % k
	local median = math.floor(#points/2)
	table.sort(points, function(a,b)
		return a:get(axix) < b:get(axis)
	end)
	
	self.root = Node( points[median], 
		   KDTree(subset(points, 1, median), depth+1),
		   KDTree(subset(points, median + 1, #points), depth+1),
		   depth
		)

end
KDTree.nearestTo = function(self, p, node)
	if node == nil and node.depth == 1 then node == self.root end
	if node == nil then return node.point end

	local k = p:dimention()
	local axis = node.depth % k
	
	local point = nil
	if p:get(axis) < node.p:get(axis) then
		point = self:nearestTo(p, node.left)
	else
		point = self:nearestTo(p, node.right)
	end

	local childVec = Vector(p, point)
	local nodeVec = Vector(p. node.point)

	if childVec:norm() <= nodeVec:norm() then
		return point
	else
		return node.point
	end
end

return KDTree
