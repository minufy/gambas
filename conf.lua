CONSOLE = true

function love.conf(t)
    t.window.width = 1280
    t.window.height = 720
    t.window.resizable = true
    t.console = CONSOLE
end

-- https://love2d.org/wiki/Config_Files