PlayState = Class({ __includes = BaseState })

function PlayState:init(params)
    self.ship = Ship({ 
        x = 16, 
        y = VIRTUAL_HEIGHT / 2,
        animations = ENTITY_DEFS['player'].animations,
        speed = ENTITY_DEFS['player'].speed,
    })
    self.ship.stateMachine = StateMachine({
        ['idle'] = function() return ShipIdleState(self.ship) end,
        ['moving'] = function() return ShipMovingState(self.ship) end,
    })
    self.ship:changeState('idle')

    self.alien = AlienShip({ 
        x = VIRTUAL_WIDTH - 16, 
        y = VIRTUAL_HEIGHT / 2,
        animations = ENTITY_DEFS['alien-1'].animations,
        speed = ENTITY_DEFS['alien-1'].speed,
    })
    self.alien.stateMachine = StateMachine({
        ['static'] = function() return AlienStaticState(self.alien) end,
        ['moving'] = function() return AlienMovingState(self.alien) end,
    })
    self.alien:changeState('moving')

    self.terrain = Terrain()
end

function PlayState:enter(params)

end

function PlayState:update(dt)
    self.ship:update(dt)
    self.alien:update(dt)
    self.terrain:update(dt)
end

function PlayState:render()
    self.ship:render()    
    self.alien:render()    
    self.terrain:render()
end
