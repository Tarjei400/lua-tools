# lua-tools

Experimental implementation of KD-tree and some helper classes. 
Aimed to use for finding spatial shapes like polygons in cartesian space.

This is example of finding closest point in a grid (this is unfortunate example) however does its job.
But if distribution of points is rather random, its better to use this method instead :)

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
	
```

#TODO: 
  - Find geo spatial primitives, closest to some point
  - Return set of primitives meatching a condition.
