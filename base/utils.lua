Utils = {}

function Utils:add(objects, object, ...)
    local o = object:new()
    o:init(...)
    table.insert(objects, o)
    return o
end

function Utils:update_objects(dt, objects)
    for i = #objects, 1, -1 do
        if objects[i].prop.remove then
            table.remove(objects, i)
        else
            objects[i]:update(dt)
        end
    end
end

function Utils:draw_objects(objects)
    for i, object in pairs(objects) do
        object:draw()
    end
end