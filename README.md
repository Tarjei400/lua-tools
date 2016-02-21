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

Finding a list of polygons closest to a given point, and containing this point inside.

```
	--Initialize some polygons
	for i = 4, 30 do
		local poly = Polygon();
		poly:addPoint(0,0)
		poly:addPoint(0,i)
		poly:addPoint(i,i)
		poly:addPoint(i,0)
	end
	
	--Lets do the search on polygon centroids, to narrow data put into sets
	local points = Polygon.calculateAllCentroids()

	local tree = KDTree(points)
	local polys = {}
	local searchTo = Point(15, 15)
	
	--Lets add custome metric, which will try to to check if point is inside polygon we are visiting
	--maintaining the default functionality of metric
	
	local p = tree:nearestTo(searchTo, function(lNorm, rNorm, node)
		local poly = node.point.polygon
		if poly:contains(searchTo) then
			table.insert(polys, poly)
		end
		return lNorm < rNorm
	end)
	
	-- I use it to visualize the tree, remove if you want ;)
	tree:print();
	
	print("Mathing polygons = "..#polys)
	print("Nearest = ", unpack(p.coords))
```
#TODO: 
  - Find geo spatial primitives, closest to some point
  - Return set of primitives meatching a condition.
