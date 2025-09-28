Timer = {}
Timer.timers = {}

function Timer:add(time, action)
    table.insert(self.timers, {
        time = love.timer.getTime()+time,
        timer = 0,
        action = action,
    })
end

function Timer:update(dt)
    for i=#self.timers, 1, -1 do
        local item = self.timers[i]
        item.timer = love.timer.getTime()
        if item.timer >= item.time then
            item.action()
            table.remove(self.timers, i)
        end
    end
end