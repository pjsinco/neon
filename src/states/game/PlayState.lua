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

    self.wave = Wave()
    self.terrain = Terrain()
end

function PlayState:enter(params)

end

function PlayState:update(dt)
print(dt)
    self.ship:update(dt)
    self.wave:update(dt)
    self.terrain:update(dt)
end

function PlayState:render()
    self.ship:render()    
    self.wave:render()    
    self.terrain:render()
end
