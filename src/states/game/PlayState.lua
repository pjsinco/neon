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

    self.waveCount = 1
    --self.level = 1

    self.terrain = Terrain()

    self.wave = Wave(self.player, WAVE_DEFS['zigzag'], self.terrain)

    self.score = nil 
    self.player.lives = nil

    Event.on('wave-completed', function(waveIndex)
        print('heardwavecompleted')
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
        self.player.lives = self.player.lives - 1
    end)
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
end
