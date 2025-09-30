Layer = Object:extend()

function Layer:new()
    self.objects = {}
end

function Layer:check_col(a, b)
    return a.x < b.x+b.w and
            b.x < a.x+a.w and
            a.y < b.y+b.h and
            b.y < a.y+a.h
end

function Layer:check_filter(a, b)
    for k, v in pairs(a.col_prop) do
        if b.prop[k] ~= nil then
            return true
        end
    end
    return false
end

function Layer:check_dist(a, b)
    local ax = a.x+a.w/2
    local ay = a.y+a.h/2
    local bx = b.x+b.w/2
    local by = b.y+b.h/2
    return math.sqrt((ax-bx)^2+(ay-by)^2)
end

function Layer:col(a, objects)
    for i, b in ipairs(objects) do
        if self:check_filter(a, b) then
            if a ~= b and self:check_col(a, b) then
                return b
            end
        end
    end
    return nil
end

function Layer:physics_update(object, objects)
    if object.vx then
        object.x = object.x+object.vx
        local x_col = self:col(object, objects)
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
        local y_col = self:col(object, objects)
        if y_col then
            if object.vy > 0 then
                object.y = y_col.y-object.h
            else
                object.y = y_col.y+y_col.h
            end
        end
    end
end

function Layer:add(object)
    table.insert(self.objects, object)
    object.layer = self
    return object
end

function Layer:update(dt)
    for i = #self.objects, 1, -1 do
        if self.objects[i].prop and self.objects[i].prop.remove then
            table.remove(self.objects, i)
        else
            self.objects[i]:update(dt)
            self:physics_update(self.objects[i], self.objects)
        end
    end
end

function Layer:draw()
    for i, object in ipairs(self.objects) do
        object:draw()
    end
end

function Layer:dist(a, r, prop)
    for _, b in ipairs(self.objects) do
        if b.prop[prop] ~= nil and self:check_dist(a, b) < r then
            return b
        end
    end
end
