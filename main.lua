Object = require("base.object")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")
    
    Font = love.graphics.newFont("data/fonts/Galmuri9.ttf", 40)
    
    require("base.assets")
    require("base.camera")
    require("base.input")
    require("base.layer")
    require("base.log")
    require("base.res")
    require("base.sm")
    require("base.timer")
    require("base.utils")

    Res:init()
    SM:init("game")
end

function love.update(dt)
    dt = math.min(1.5, dt*60)
    UpdateInputs()
    Camera:update(dt)
    SM:update(dt)
    Log:update(dt)
    Timer:update(dt)
    ResetWheelInput()
end

function love.draw()
    Res:before()
    SM:draw()
    Res:after()
    Log:draw()
end