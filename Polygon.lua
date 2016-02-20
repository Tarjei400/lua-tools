--[[

#########################################################################
#                                                                       #
# polygon.lua                                                           #
#                                                                       #
# Generic 2D polygon class                                              #
#                                                                       #
# Copyright 2011 Josh Bothun                                            #
# joshbothun@gmail.com                                                  #
# http://minornine.com                                                  #
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

Class = require 'class'
Point = require 'Point'
Vector = require 'Vector'


local Polygon = Class.create()


-- Add a new point to the polygon
function Polygon:addPoint(x,y,z)
    local point = Point(x,y,z)
    point.polygon = self
    table.insert(self.points, point)
end

function Polygon:numPoints()
    return math.floor(#self.points)
end

function Polygon:setPoint(i, x, y)
    self[i * 2 - 1] = x
    self[i * 2] = y
end

function Polygon:getPointTables()
    return self.points
end

-- Get the centroid of the polygon
-- http://en.wikipedia.org/wiki/Centroid
function Polygon:getCentroid()
    local centroid = Point(0,0,0)
	
    for point in self.points do
        centroid = centroid + point
    end
    local npoints = self:numPoints()
    return centroid / npoints
end


-- Reorder the points such that the polygon is regular
-- Note this function is expensive
function Polygon:normalize()
    local c = self:getCentroid()
    table.sort(self.points, function(a, b)
        return math.atan2(a.y - c.y, a.x - c.x) >
               math.atan2(b.y - c.y, b.x - c.x)
    end)
end


-- Check if this polygon contains a point
-- Ray casting theorem
function Polygon:contains(mx, my)
    local points = self.points
    local i, j = #points, #points
    local oddNodes = false

    for i=1, #points do
        if ((points[i].y < my and points[j].y >= m.y
                or points[j].y< m.y and points[i].y>=m.y) and (points[i].x<=m.x
                or points[j].x<=m.x)) then
                if (points[i].x+(m.y-points[i].y)/(points[j].y-points[i].y)*(points[j].x-points[i].x)<m.x) then
                        oddNodes = not oddNodes
                end
        end
        j = i
    end

    return oddNodes
end

return Polygon