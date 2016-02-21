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
		print("{", unpack(n.point.coords))
	if n.left~=nil then print(string.rep('-', n.depth).."L:")self:print(n.left) end
	if n.right~=nil then print(string.rep('-', n.depth).."R:")self:print(n.right) end
end
KDTree.nearestTo = function(self, p, node, depth)

	if depth == nil then depth = self.root.depth end
	if node == nil then
		if depth == 1 then
			node = self.root
		end
	end
	local k = p:dimention()

	local axis = node.depth % k + 1
	
	local point = nil

	local leftNorm = -1;
	local rightNorm = -1;
	local nodeVec = Vector(p, node.point)


	if node.left ~= nil then
		local leftVec = Vector(p, node.left.point)
		leftNorm = leftVec:norm()
	end
	if node.right ~= nil then
		local rightVec = Vector(p, node.right.point)
		rightNorm = rightVec:norm()
	end

	if leftNorm + rightNorm == -2 or nodeVec:norm() == 0  then

		return node.point
	end

	--If distance from left side is smaller, we look to the left
	if leftNorm < rightNorm then
		if node.left == nil then
			if node.right == nil then
				print("Children nil")
				return node.point
			else
				point = self:nearestTo(p, node.right, depth + 1)
			end

		else
			print("L:"..string.rep('-', depth))
			point = self:nearestTo(p, node.left, depth+1)
		end
	-- Otherwise we check to the right
	else
		if node.right == nil then
			print("right nil")
			if node.left == nil then
				print("left nil")
				return node.point
			else
				point = self:nearestTo(p, node.left, depth + 1)
			end

		else
			print("R:"..string.rep('-', depth))
			point = self:nearestTo(p, node.right, depth+1)
		end
	end

	local childVec = Vector(p, point)

	if childVec:norm() >= nodeVec:norm() then
		return node.point
	else
		return point
	end
end

return KDTree
