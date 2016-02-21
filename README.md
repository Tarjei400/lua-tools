# lua-tools

Experimental implementation of KD-tree and some helper classes. 
Aimed to use for finding spatial shapes like polygons in cartesian space.

This is example of finding closest point in a grid (this is unfortunate example) however does its job.

```
  KDTree = require 'kdtree'
  Point = require 'Point'
  
	local points ={}
	for x = 0, 100 do
			for y = 0, 100 do
				table.insert(points, Point(x,y))
			end
	end

	local tree = KDTree(points);
	local nearest = tree:nearestTo(Point(-1,7))
	assert_equal(Point(0,7), nearest)
```
