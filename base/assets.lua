local img = require("data.img")
local audio = require("data.audio")

Img = {}
Audio = {}

local function newImg(name)
    local path = "data/imgs/"..name..".png"
    return love.graphics.newImage(path)
end

local function newAudio(name, volume)
    volume = volume or 0.5
    local path = "data/audio/"..name..".ogg"
    local audio = {
        source = love.audio.newSource(path, "static")
    }
    audio.source:setVolume(volume)
    function audio:play()
        audio.source:stop()
        audio.source:play()
    end
    return audio
end

for i, name in ipairs(img) do
    Img[name] = newImg(name)
end
for name, volume in pairs(audio) do
    Audio[name] = newAudio(name, volume)
end