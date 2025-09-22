local Object = {}

function Object:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Object:init()
end

return Object