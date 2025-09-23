Object = require("base.object")
require("base.assets")
require("base.camera")
require("base.input")
require("base.res")
require("base.sm")
require("base.utils")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")
    
    Res:init()
    SM:init("game")
end

function love.update(dt)
    dt = math.min(1.5, dt*60)
    UpdateInputs()
    SM:update(dt)
    ResetWheelInput()
end

function love.draw()
    Res:before()
    SM:draw()
    Res:after()
end