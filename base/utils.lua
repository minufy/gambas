Utils = {}

function rgb(r, g, b)
    return {r/255, g/255, b/255}
end

function rgba(r, g, b, a)
    return {r/255, g/255, b/255, a}
end

function alpha(rgb, a)
    return {rgb[1], rgb[2], rgb[3], a}
end

function ResetColor()
    love.graphics.setColor(1, 1, 1, 1)
end

local function dist(a, b)
    local ax = a.x+a.w/2
    local ay = a.y+a.h/2
    local bx = b.x+b.w/2
    local by = b.y+b.h/2
    return math.sqrt((ax-bx)^2+(ay-by)^2)
end

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
    if object.vx then
        object.x = object.x+object.vx
        local x_col = col(object, objects)
        if x_col then
            if object.vx > 0 then
                object.x = x_col.x-object.w
            else
                object.x = x_col.x+x_col.w
            end
        end
    end
    if object.vy then
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
end

function Utils:add(object, ...)
    local o = object:new()
    o:init(...)
    table.insert(SM:current().objects, o)
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

function Utils:dist(a, r, prop)
    local objects = SM:current().objects
    for _, b in ipairs(objects) do
        if b.prop[prop] ~= nil and dist(a, b) < r then
            return b
        end
    end
end