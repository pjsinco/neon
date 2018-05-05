Wave = Class({})

function Wave:init(params)
    self.aliens = {}

    self.alienCount = 8
    for i = 1, self.alienCount do
        local alien = self:spawnAlien({
            x = (i % 2 == 0) and VIRTUAL_WIDTH - 18 or VIRTUAL_WIDTH - 54,
            y = i * ((VIRTUAL_HEIGHT - 20) / self.alienCount),
        })
        table.insert(self.aliens, alien)
    end
end

function Wave:update(dt)
    for _, alien in pairs(self.aliens) do
        alien:update(dt)
    end
end

function Wave:render()
    for _, alien in pairs(self.aliens) do
        alien:render()
    end
end

function Wave:spawnAlien(params)
    local alien = AlienShip({ 
        x = params.x, 
        y = params.y,
        animations = ENTITY_DEFS['alien-1'].animations,
        speed = ENTITY_DEFS['alien-1'].speed,
    })

    alien.stateMachine = StateMachine({
        ['static'] = function() return AlienStaticState(alien) end,
        ['moving'] = function() return AlienMovingState(alien) end,
    })
    alien:changeState('moving')
    
    return alien
end
