SM = {}

function SM:init(name)
    print(name)
    self.scene = nil
    self:load_scene(name)
end

function SM:current()
    return self.scene
end

function SM:load_scene(name)
    self.scene = require("game.scenes."..name):new()
    self.scene:init()
end

function SM:draw()
    self.scene:draw()
end

function SM:update(dt)
    self.scene:update(dt)
end