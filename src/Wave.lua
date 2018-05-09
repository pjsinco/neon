Wave = Class({})

function Wave:init(player, defs, terrain)
    self.player = player
    self.terrain = terrain
    self.aliens = {}
    self.alienCount = defs.alienCount
    self.duration = defs.duration
    self.speedMultiplier = defs.speedMultiplier

    self.rockets = {}

    local rocket = Rocket({
        x = TILE_SIZE * 50,
        y = math.floor(self.terrain:tileToPoint(self.terrain.gridYs[50]) - 10),
        width = ENTITY_DEFS['rocket-1'].width,
        height = ENTITY_DEFS['rocket-1'].height,
        speed = ENTITY_DEFS['rocket-1'].speed,
        texture = ENTITY_DEFS['rocket-1'].texture,
        animations = ENTITY_DEFS['rocket-1'].animations,
    })
    rocket.stateMachine = StateMachine({
        ['idle'] = function() return RocketIdleState(rocket) end,
        ['flying'] = function() return RocketFlyingState(rocket) end,
    })
    rocket:changeState('idle')

    table.insert(self.rockets, rocket)

    for i = 1, self.alienCount do
        local alien = self:spawnAlien({
            x = (i % 2 == 0) and VIRTUAL_WIDTH - 18 or VIRTUAL_WIDTH - 54,
            y = i * ((VIRTUAL_HEIGHT - 20) / self.alienCount),
        })
        table.insert(self.aliens, alien)
    end

    Timer.after(self.duration, function() 
        Event.dispatch('wave-completed')
    end)
end

function Wave:update(dt)
    Timer.update(dt)
    self.terrain:update(dt)
    self.player:update(dt)


    if self.player.inPlay and self.player:collidesWithTerrain(self.terrain) then
        Event.dispatch('player-collided', self.player, self.terrain)
    end

    for _, rocket in pairs(self.rockets) do
        if self.player.inPlay and rocket:collides(self.player) then
            Event.dispatch('player-collided', self.player, rocket)
        end

        rocket:update(dt)
    end

    for _, alien in pairs(self.aliens) do
        if alien.active and self.player.inPlay and self.player:collides(alien) then
            Event.dispatch('player-collided', self.player, alien)
        end
    
        for _, projectile in pairs(self.player.projectiles) do
            if alien.active and projectile:collides(alien) then
                Event.dispatch('alien-collided', alien, projectile)
            end
        end

        alien:update(dt)
    end

    --TODO reverse iterate over aliens and remove inactive ones
end

function Wave:render()
    self.terrain:render()
    self.player:render()

    for _, rocket in pairs(self.rockets) do
        rocket:render()
    end

    for _, alien in pairs(self.aliens) do
        alien:render()
    end
end

function Wave:spawnAlien(params)
    local alien = AlienShip({ 
        x = params.x, 
        y = params.y,
        animations = ENTITY_DEFS['alien-1'].animations,
        speed = ENTITY_DEFS['alien-1'].speed * self.speedMultiplier,
        value = ENTITY_DEFS['alien-1'].value,
    })

    alien.stateMachine = StateMachine({
        ['static'] = function() return AlienStaticState(alien) end,
        ['moving'] = function() return AlienMovingState(alien) end,
    })
    alien:changeState('moving')
    
    return alien
end
