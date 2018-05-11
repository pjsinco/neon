PlayState = Class({ __includes = BaseState })

function PlayState:init(params)

    Timer.after(0.5, function() 
        gSounds['theme']:setLooping(true)
        gSounds['theme']:play()
    end)

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

    self.waveCount = 1
    --self.level = 1

    self.terrain = Terrain()

    self.wave = Wave(self.player, WAVE_DEFS['zigzag'], self.terrain)

    self.score = nil 
    self.player.lives = nil
    self.paused = false

    Event.on('wave-completed', function(waveIndex)
        print('heardwavecompleted')
        print(self.wave:getAlienCount())
        self.wave:cleanupEntities(self.wave.aliens)
        self.waveCount = self.waveCount + 1
        self.wave = Wave(self.player,
                         WAVE_DEFS['zigzag-2'],
                         self.terrain,
                         self.wave.rockets)
    end)

    Event.on('scored', function(amount)
        self.score = self.score + amount
    end)

    Event.on('player-collided', function(player, other)
        Chain(
            function(go)
                Timer.after(2, go)
            end,
            function(go)
                self.paused = true
                self.gameMessage = GameMessage('Player 1', go)
            end,
            function(go)
                self.paused = false
                self.gameMessage = nil
            end
        )()

        self.player.lives = self.player.lives - 1
        if self.player.lives == 0 then
            gStateMachine:change('game-over')
            gSounds['theme']:stop()
            gSounds['game-over']:play()
        end
    end)
end

function PlayState:enter(params)
    self.score = params.score or 0
    self.player.lives = params.lives or STARTING_LIVES
end

function PlayState:update(dt)
    Timer.update(dt)
    if not self.paused then
        self.wave:update(dt)
    end

    if self.gameMessage then
        self.gameMessage:update(dt)
    end
end

function PlayState:render()
    -- show score
    love.graphics.print(tostring(self.score),
                        SCREEN_PADDING_LEFT,
                        SCREEN_PADDING_TOP)

    -- show lives left
    love.graphics.print(tostring(self.player.lives),
                        VIRTUAL_WIDTH - SCREEN_PADDING_RIGHT - IMAGE_FONT_WIDTH,
                        SCREEN_PADDING_TOP)

    -- show wave number
    love.graphics.printf('Wave ' .. tostring(self.waveCount),
                         0,
                         SCREEN_PADDING_TOP,
                         VIRTUAL_WIDTH - SCREEN_PADDING_RIGHT - SCREEN_PADDING_LEFT,
                         "center")


    self.wave:render()
    
    if self.gameMessage then
        self.gameMessage:render()
    end
end
