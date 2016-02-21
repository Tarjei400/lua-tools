--[[

#########################################################################
#                                                                       #
# polygon.lua                                                           #
#                                                                       #
# Generic point class 					                                #
#                                                                       #
# Copyright 2016 Adrian Jutrowski                                       #
# joshbothun@gmail.com                                                  #
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
local Point = Class.create()
Point.initialize = function(self, ...)
	self.coords = {}
	
	for k, coord in ipairs({...}) do
		table.insert(self.coords, coord)
	end
end

Point.dimention = function(self)
	return #self.coords
end

Point.get = function(self, dim)
	return self.coords[dim]
end

Point.move = function(self ,...)
	return self + Point(...)
end
Class.overloadAdd(Point ,  function(a,b)
	local newCoords = {}
	for k, coord in ipairs(a.coords) do
		newCoords[k] = coord + b.coords[k]
	end
	return Point(unpack(newCoords))
end)
Class.overloadSub(Point , function(a,b)
	local newCoords = {}
	for k, coord in ipairs(a.coords) do
		newCoords[k] = coord - b.coords[k]
	end
	return Point(unpack(newCoords))
end)

Class.overloadMul (Point ,  function(a,scalar)
	local newCoords = {}
	for k, coord in ipairs(a.coords) do
		newCoords[k] = coord *scalar
	end
	return Point(unpack(newCoords))
end)

Class.overloadDiv(Point ,  function(a,scalar)
	local newCoords = {}
	for k, coord in ipairs(a.coords) do
		newCoords[k] = coord /scalar
	end
	return Point(unpack(newCoords))
end)

Class.overloadEq(Point , function(a,b)
	local ret = true;
	for k, coord in ipairs(a.coords) do
		ret = coord == b.coords[k]
		if not ret then
			break
		end
	end
	return ret
end)

return Point

