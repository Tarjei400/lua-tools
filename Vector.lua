--[[

#########################################################################
#                                                                       #
# polygon.lua                                                           #
#                                                                       #
# Generic vector class	                                                #
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

local Vector = Class.create()
Vector.initialize = function(self, from, to)
	if not from:isa(Point) or not to:isa(Point) then error("from and to needs to be points") end
	self.from = from
	self.to = to
end

Vector.norm = function(self)
	local p = self.to - self.from
	local ret = 0;
	for k , coord in pairs(p.coords) do
		ret = ret + coord*coord
	end	
	return math.sqrt(ret)
end

return Vector
