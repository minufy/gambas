local Player = Object:extend()

function Player:new(x, y)
    self.w = Img.player:getWidth()
    self.h = Img.player:getHeight()

    self.x = x
    self.y = y
    
    self.tags = {
        player = true,
    }
    self.col_tags = {}
end

function Player:draw()
    love.graphics.draw(Img.player, self.x, self.y)
end

function Player:update(dt)
    self.layer:dist(self, 100, "spike")

    local ix = 0
    if Input.right.down then
        ix = ix+1
    end
    if Input.right.pressed then
        Log:log(self.x, self.y)
    end
    self.vx = ix*2*dt
end

return Player