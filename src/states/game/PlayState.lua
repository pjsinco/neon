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
    self.player:changeState('moving')

    self.wave = Wave(self.player)

    self.score = nil 
    self.player.lives = nil

    Event.on('scored', function(amount)
        self.score = self.score + amount
    end)

    Event.on('player-collided', function(player, other)
        self.player.lives = self.player.lives - 1
    end)

--    Event.on('player-collided', function(player, other)
--        Chain( 
--            function(go)
--                player:changeState('idle') 
--                player.inPlay = false
--                gSounds['explosion-1']:stop()
--                gSounds['explosion-1']:play()
--                go()
--            end,
--            player:generateExplode(), 
--            function(go)
--                player.x = 16
--                player.y = VIRTUAL_HEIGHT / 2 - (player.height / 2)
--                player:changeState('moving')
--                player.inPlay = true
--                go()
--            end
--        )()
--    end)
end

function PlayState:enter(params)
    self.score = params.score or 0
    self.player.lives = params.lives or STARTING_LIVES
end

function PlayState:update(dt)
    self.wave:update(dt)
end

function PlayState:render()
    -- show score
    love.graphics.print(tostring(self.score),
                        SCREEN_PADDING_LEFT,
                        SCREEN_PADDING_TOP)

    love.graphics.print(tostring(self.player.lives),
                        VIRTUAL_WIDTH - SCREEN_PADDING_RIGHT - IMAGE_FONT_WIDTH,
                        SCREEN_PADDING_TOP)


    self.wave:render()
end
