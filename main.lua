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
    SM:update(dt)
end

function love.draw()
    SM:draw()
end