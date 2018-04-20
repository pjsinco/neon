--[[
   Neon
]]

require 'src/Dependencies'

function love.load()

end

function love.update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()

end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.resize(w, h)
    
end
