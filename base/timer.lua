Timer = {}
Timer.timers = {}

function Timer:add(time, action)
    table.insert(self.timers, {
        time = time,
        timer = 0,
        action = action,
    })
end

function Timer:update(dt)
    for i=#self.timers, 1, -1 do
        local item = self.timers[i]
        item.timer = item.timer+dt
        if item.timer >= item.time then
            item.action()
            table.remove(self.timers, i)
        end
    end
end