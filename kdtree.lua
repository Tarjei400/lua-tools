--[[

#########################################################################
#                                                                       #
# kdtree.lua                                                            #
#                                                                       #
# Generic KDTree class                                                  #
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

Class = require "class"
Point = require "Point"
Vector = require "Vector"

local function subset(t, from, to)
	local ret = {}
	if to < from then return ret end
	for i = from, to do
		table.insert(ret, t[i])
	end
	return ret
end
local Node = Class.create()
Node.initialize= function(self, point, left, right, depth)
	self.point = point
	self.left = left
	self.right = right
	self.depth = depth
end
local KDTree = Class.create()
local i = 0;
KDTree.initialize = function(self, points, depth)
	if #points == 0 then
		return {}
	end
	depth = depth ~= nil and depth or 1

	local k = points[1]:dimention()
	
	if #points == 1 then
		self.root = Node( points[1], nil, nil, depth)
		return self.root
	end
	--Select axis, sort points
	local axis = depth % k + 1

	local median = math.floor(#points/2)
	table.sort(points, function(a,b)
		return a:get(axis) < b:get(axis)
	end)
	
	local left = KDTree(subset(points, 1, median-1), depth+1)
	local right = KDTree(subset(points, median + 1, #points), depth+1);
	self.root = Node( points[median], 
		   left.root,
		   right.root,
		   depth
		)


end
KDTree.print = function(self,n)
	if n == nil then n = self.root end
		
	if n.left~=nil then self:print(n.left) end
	if n.right~=nil then self:print(n.right) end
end
KDTree.nearestTo = function(self, p, node)
	print( "NEAREST")
	if node == nil then print("root") node = self.root end

	local k = p:dimention()

	local axis = node.depth % k + 1
	
	local point = nil
	if p:get(axis) < node.point:get(axis) then
		if node.left == nil then print("left nil") return  node.point end
		point = self:nearestTo(p, node.left)
	else
		if node.right == nil then print("right nil") return node.point end
		point = self:nearestTo(p, node.right)
	end

	local childVec = Vector(p, point)

	local nodeVec = Vector(p, node.point)

	if childVec:norm() <= nodeVec:norm() then
		return point
	else
		return node.point
	end
end

return KDTree
