--[[

#########################################################################
#                                                                       #
# polygon.lua                                                           #
#                                                                       #
# Generic 2D point class , containing layer parameter z                 #
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
Point.initialize = function(self, x,y,z)
	if x == nil or y == nil or z == nil then error("Invalid coordinates") end
	self.x = x
	self.y = y
	--Z is only layer parameter
	self.z = z
end

Class.overloadAdd = function(a,b)
	return Point(a.x + b.x, a.y + b.y)
end
Class.overloadSub = function(a,b)
	return Point(a.x - b.x, a.y - b.y)
end

Class.overloadMul = function(a,scalar)
	return Point(a.x * scalar, a.y * scalar)
end
Class.overloadDiv = function(a,scalar)
	return Point(a.x / scalar, a.y / scalar)
end
return Point

