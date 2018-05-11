GameMessage = Class({})

--[[
   Flash a message to the player
]]
function GameMessage:init(message, level, callback)
    self.levels = { 'info', 'warning' }
    self.message = message
    self.masking = false
    self.level = level or 'info'
    self.callback = callback or function() end

    self.timers = {}
    
    Timer.every(0.5, function()
        self.masking = not self.masking
    end):group(self.timers):limit(6):finish(function() 
        self.callback()
    end)
end

function GameMessage:update(dt)
    Timer.update(dt, self.timers)
end

function GameMessage:render()
    love.graphics.setFont(gFonts['image'])

    if self.level == 'warning' then
        love.graphics.setColor(gColors['red'])
    else
        love.graphics.setColor(gColors['white'])
    end
     

    if self.masking then
        love.graphics.setColorMask(false, false, false, false)
    end
    love.graphics.printf(self.message,
                         0,
                         VIRTUAL_HEIGHT / 2,
                         VIRTUAL_WIDTH,
                         'center')

    love.graphics.setColorMask(true, true, true, true)
    
end
