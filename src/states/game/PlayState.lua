PlayState = Class({ __includes = BaseState })

function PlayState:init(params)
    self.player = Ship({ 
        x = 16, 
        y = VIRTUAL_HEIGHT / 2,
        animations = ENTITY_DEFS['player'].animations,
        speed = ENTITY_DEFS['player'].speed,
    })
    self.player.stateMachine = StateMachine({
        ['idle'] = function() return ShipIdleState(self.player) end,
        ['moving'] = function() return ShipMovingState(self.player) end,
    })
    self.player:changeState('idle')

    self.wave = Wave(self.player)

    self.score = 0

    Event.on('scored', function(amount)
        self.score = self.score + amount
    end)
end

function PlayState:enter(params)
    self.score = params.score or 0
end

function PlayState:update(dt)
    self.wave:update(dt)
end

function PlayState:render()
    -- show score
    love.graphics.print(tostring(self.score),
                        SCREEN_PADDING_LEFT,
                        SCREEN_PADDING_TOP)

    self.wave:render()
end
