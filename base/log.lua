local config = require("data.config").log

Log = {}
Log.last_log = ""
Log.alpha = 0
Log.font = nil

function Log:log(...)
    local log = os.date().." : "
    for _, s in ipairs({...}) do
        log = log..s.." "
    end
    self.last_log = log
    self.alpha = 1
    print(log)
end

function Log:draw()
    love.graphics.setFont(config.font)
    love.graphics.setColor(0, 0, 0, self.alpha*0.1)
    love.graphics.print(self.last_log, 1, 1)
    love.graphics.setColor(1, 1, 1, self.alpha)
    love.graphics.print(self.last_log)
    ResetColor()
end

function Log:update(dt)
    self.alpha = math.max(self.alpha-dt*0.005, 0)
end