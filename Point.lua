--[[

#########################################################################
#                                                                       #
# polygon.lua                                                           #
#                                                                       #
# Generic point class 					                #
#                                                                       #
# Copyright 2016 Adrian Jutrowski                                       #
# joshbothun@gmail.com                                                  #
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
local Point = Class.create()
Point.initialize = function(self, ... )
	self.coords = {}
	
	for k, coord in ipairs(arg) do
		table.insert(self.coords, coord)
	end
end

Class.overloadAdd = function(a,b)
	local newCoords = {}
	for k, coord in ipairs(a.coods) do
		newCoords = coord + b.coords[k]
	end
	return Point(table.unpack(newCoords))
end
Class.overloadSub = function(a,b)
	local newCoords = {}
	for k, coord in ipairs(a.coods) do
		newCoords = coord - b.coords[k]
	end
	return Point(table.unpack(newCoords))
end

Class.overloadMul = function(a,scalar)
	local newCoords = {}
	for k, coord in ipairs(a.coods) do
		newCoords = coord *scalar
	end
	return Point(table.unpack(newCoords))
end
Class.overloadDiv = function(a,scalar)
	local newCoords = {}
	for k, coord in ipairs(a.coods) do
		newCoords = coord /scalar
	end
	return Point(table.unpack(newCoords))
end
return Point

