Object = require("base.object")
require("base.input")
require("base.sm")
require("base.assets")
require("base.utils")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")

    SM:init("game")
end

function love.update(dt)
    dt = math.min(1.5, dt*60)
    UpdateInputs()
    SM:update(dt)
    ResetWheelInput()
end

function love.draw()
    SM:draw()
end