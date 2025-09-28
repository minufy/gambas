local config = require("data.config").res

Res = {}
Res.w = config.w
Res.h = config.h
Res.shift_x = 0
Res.shift_y = 0

function Res:init()
    local w, h = love.graphics.getDimensions()
    self:resize(w, h)
    self.canvas = love.graphics.newCanvas(self.w, self.h, {
        -- format = "rgba16f" -- lovejs color rounding fix
    })
end

function Res:before()
    love.graphics.setCanvas(self.canvas)
    love.graphics.clear()
end

function Res:after()
    love.graphics.setCanvas()
    love.graphics.draw(self.canvas, self.shift_x, self.shift_y, 0, self.zoom, self.zoom)
end

function Res:getX()
    return (love.mouse.getX()-self.shift_x)/self.zoom
end

function Res:getY()
    return (love.mouse.getY()-self.shift_y)/self.zoom
end

function Res:resize(w, h)
    if self.w-w > self.h-h then
        self.zoom = w/self.w
        self.shift_x = 0
        self.shift_y = h/2-Res.h*Res.zoom/2
    else
        self.zoom = h/self.h
        self.shift_x = w/2-Res.w*Res.zoom/2
        self.shift_y = 0
    end
end

function love.resize(w, h)
    Res:resize(w, h)
end