local Game = Object:new()

local Player = require("game.objects.player")

function Game:init()
    self.objects = {}
    Utils:add(self.objects, Player, Res.w/2, Res.h/2)
end

function Game:draw()
    Utils:draw_objects(self.objects)
end

function Game:update(dt)
    Utils:update_objects(dt, self.objects)
end

return Game