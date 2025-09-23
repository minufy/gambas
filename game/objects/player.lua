local Player = Object:new()

function Player:init()
    self.w = Img.player:getWidth()
    self.h = Img.player:getHeight()

    self.x = 0
    self.y = 0
    
    self.prop = {
        player = true,
    }
    self.col_prop = {}
end

function Player:draw()
    love.graphics.draw(Img.player, self.x, self.y)
end

function Player:update(dt)
end

return Player