local Class = {}
Class.create = function(parent)
	local newClass = {}
	newClass.overloads = {}
	function newClass:new(instance)
		local instance = instance or {}
		newClass.overloads.__index = newClass
		setmetatable(instance, newClass.overloads)
		return instance
	end
	
	setmetatable(newClass, {
		__call = function(t, ...)
			local instance = newClass:new()
			if instance.initialize ~= nil then
				instance:initialize(...)
			end
			return instance
		end
	})
	
	if(parent ~= nil) then
		local _mt = getmetatable(newClass)
		_mt.__index = parent
	end

	function newClass:getSelf()
		return newClass
	end

	function newClass:getParent()
		return parent
	end

	function newClass:isa(class)
		local tmp = newClass
		while(tmp ~= nil) do
			if(tmp == class) then
				return true
			end

			tmp = tmp:getParent()
		end

		return false
	end
	
	function newClass:setAttributes(attributes)
		for k, v in pairs(attributes) do
			newClass[k] = v
		end
	end

	return newClass
end
Class.overloadEq  = function(class, callback)
	class.overloads.__eq = callback
end
Class.overloadAdd  = function(class, callback)
	class.overloads.__add = callback
end
Class.overloadSub = function(class, callback)
	class.overloads.__sub = callback
end
Class.overloadMul = function(class, callback)
	class.overloads.__mul = callback
end
Class.overloadDiv = function(class, callback)
	class.overloads.__div = callback
end
Class.overloadPairs = function(class, callback)
	class.overloads.__pairs = callback
end
Class.overloadIPairs = function(class, callback)
	class.overloads.__ipairs = callback
end
Class.overloadToString = function(class, callback)
	class.overloads.__tostring = callback
end

return Class;
