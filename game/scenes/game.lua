local Game = Object:new()

local Player = require("game.objects.player")

function Game:init()
    self.objects = NewLayer()
    self.objects:add(Player, Res.w/2, Res.h/2)
end

function Game:draw()
    Camera:start()
    self.objects:draw()
    Camera:stop()
end

function Game:update(dt)
    self.objects:update(dt)
end

return Game