Utils = {}

local function check_col(a, b)
    return a.x < b.x+b.w and
            b.x < a.x+a.w and
            a.y < b.y+b.h and
            b.y < a.y+a.h
end

local function check_filter(a, b)
    for k, v in pairs(a.col_prop) do
        if b.prop[k] ~= nil then
            return true
        end
    end
    return false
end

local function col(a, objects)
    for i, b in ipairs(objects) do
        if check_filter(a, b) then
            if a ~= b and check_col(a, b) then
                return b
            end
        end
    end
    return nil
end

local function physics_update(object, objects)
    object.x = object.x+object.vx
    local x_col = col(object, objects)
    if x_col then
        if object.vx > 0 then
            object.x = x_col.x-object.w
        else
            object.x = x_col.x+x_col.w
        end
    end
    object.y = object.y+object.vy
    local y_col = col(object, objects)
    if y_col then
        if object.vy > 0 then
            object.y = y_col.y-object.h
        else
            object.y = y_col.y+y_col.h
        end
    end
end

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
            physics_update(objects[i], objects)
        end
    end
end

function Utils:draw_objects(objects)
    for i, object in pairs(objects) do
        object:draw()
    end
end