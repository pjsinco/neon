Wave = Class({})

function Wave:init(params)
    self.aliens = {}

    local alien = AlienShip({ 
        x = VIRTUAL_WIDTH - 16, 
        y = VIRTUAL_HEIGHT / 2,
        animations = ENTITY_DEFS['alien-1'].animations,
        speed = ENTITY_DEFS['alien-1'].speed,
    })

    alien.stateMachine = StateMachine({
        ['static'] = function() return AlienStaticState(alien) end,
        ['moving'] = function() return AlienMovingState(alien) end,
    })
    alien:changeState('moving')

    table.insert(self.aliens, alien)
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
