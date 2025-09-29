SM = {}

function SM:init(name)
    self:load_scene(name)
end

function SM:load_scene(name, ...)
    self.scene = require("game.scenes."..name)(...)
end

function SM:draw()
    self.scene:draw()
end

function SM:update(dt)
    self.scene:update(dt)
end