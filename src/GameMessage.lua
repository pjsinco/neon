GameMessage = Class({})

--[[
   Flash a message to the player
]]
function GameMessage:init(message, callback)
    self.message = message
    self.mask = false

    self.timers = {}
    
    Timer.every(0.5, function()
        self.mask = not self.mask
    end):group(self.timers):limit(6):finish(function() 
        callback()
    end)
end

function GameMessage:update(dt)
    Timer.update(dt, self.timers)
end

function GameMessage:render()
    love.graphics.setFont(gFonts['image'])
    love.graphics.setColor({ 255, 255, 255, 255 })

    if self.mask then
        love.graphics.setColorMask(false, false, false, false)
    end
    love.graphics.printf(self.message,
                         0,
                         VIRTUAL_HEIGHT / 2,
                         VIRTUAL_WIDTH,
                         'center')

    love.graphics.setColorMask(true, true, true, true)
    
end
