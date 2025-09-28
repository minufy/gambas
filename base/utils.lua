function rgb(r, g, b)
    return {r/255, g/255, b/255}
end

function rgba(r, g, b, a)
    return {r/255, g/255, b/255, a}
end

function alpha(rgb, a)
    return {rgb[1], rgb[2], rgb[3], a}
end

function Hex(hex)
    hex = hex:gsub("#","")
    return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
end

function ResetColor()
    love.graphics.setColor(1, 1, 1, 1)
end