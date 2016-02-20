--[[

#########################################################################
#                                                                       #
# polygon.lua                                                           #
#                                                                       #
# Generic 2D vector class                                               #
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

local KDTree = Class.create()


