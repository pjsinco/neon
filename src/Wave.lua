Wave = Class({})

function Wave:init(player, defs, terrain, rockets)
    self.player = player
    self.terrain = terrain
    self.terrain.maxHeight = defs.terrainMaxHeight
    self.terrain.minHeight = defs.terrainMinHeight
    self.aliens = {}
    self.powerup = nil 
    self.rockets = rockets or {}
    self.alienCount = defs.alienCount
    self.duration = defs.duration
    self.speedMultiplier = defs.speedMultiplier
    self.powerupDuration = defs.powerupDuration

    -- where we can expect there to be no terrain
    self.liveArea = VIRTUAL_HEIGHT - 
                    SCREEN_PADDING_TOP_WITH_SCORE - 
                    (self.terrain.maxHeight * TILE_SIZE)

    for i = 1, self.alienCount do
        local alien = self:spawnAlien({
            x = (i % 2 == 0) and VIRTUAL_WIDTH - 18 or VIRTUAL_WIDTH - 54,
            y = i * ((self.liveArea - 34) / self.alienCount),
            -- 34 is an estimate of the alien's vertical range, I think
        })
        table.insert(self.aliens, alien)
    end

    Timer.after(self.duration, function() 
        Event.dispatch('wave-completed')
    end)

    Timer.every(defs.maybeSpawnRocketSeconds, function()
        self:maybeSpawnRocket(#self.terrain.gridYs - 1,
                              ENTITY_DEFS['rocket-1'],
                              defs.maybeSpawnRocketChance) 
    end)

    Timer.every(defs.maybeSpawnPowerupSeconds, function()
        if self.powerup == nil then
            local powerupType = defs.powerups[math.random(#defs.powerups)]
            self:maybeSpawnPowerup(defs.maybeSpawnPowerupChance,
                                   ENTITY_DEFS[powerupType])
        end
    end)
end

function Wave:update(dt)
    self:cleanupEntities(self.rockets)

    Timer.update(dt)
    self.terrain:update(dt)
    self.player:update(dt)

    if self.player.inPlay and self.player:collidesWithTerrain(self.terrain) then
        Event.dispatch('player-collided', self.player, self.terrain)
    end

    for _, rocket in pairs(self.rockets) do
        if self.player.inPlay and rocket:collides(self.player) then
            Event.dispatch('player-collided', self.player, rocket)
            rocket.active = false
        end

        rocket:update(dt)
    end

    for _, alien in pairs(self.aliens) do
        if not alien.hit and self.player.inPlay and self.player:collides(alien) then
            Event.dispatch('player-collided', self.player, alien)
        end
    
        for _, projectile in pairs(self.player.projectiles) do
            if not alien.hit and projectile:collides(alien) then
                Event.dispatch('alien-collided', alien, projectile)
                projectile.active = false
            end
        end

        alien:update(dt)
    end

    
    if self.powerup ~= nil then
        if self.powerup.remove then
            self.powerup = nil
        else
            self.powerup:update(dt)
            if not self.powerup.hit and 
                   self.player.inPlay and 
                   self.player:collides(self.powerup) then
                Event.dispatch('powerup-consumed', self.powerup)
            end
        end
    end

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

    if self.powerup ~= nil then
        self.powerup:render()
    end
end

function Wave:spawnAlien(params)
    local alien = AlienShip({ 
        x = params.x, 
        y = params.y,
        animations = ENTITY_DEFS['alien-1'].animations,
        speed = ENTITY_DEFS['alien-1'].speed * self.speedMultiplier,
        value = ENTITY_DEFS['alien-1'].value,
        category = ENTITY_DEFS['alien-1'].category,
    })

    alien.stateMachine = StateMachine({
        ['static'] = function() return AlienStaticState(alien) end,
        ['moving'] = function() return AlienMovingState(alien) end,
    })
    alien:changeState('moving')
    
    return alien
end

function Wave:maybeSpawnRocket(terrainIndex, rocketDef, chance)
    if (math.random(2) == 1) then
        local rocket = Rocket({
            x = TILE_SIZE * terrainIndex,
            y = self.terrain:tileToPoint(self.terrain.gridYs[terrainIndex]) - 10,
            width      = rocketDef.width,
            height     = rocketDef.height,
            speed      = rocketDef.speed,
            texture    = rocketDef.texture,
            animations = rocketDef.animations,
            category = rocketDef.category,
        })
        rocket.stateMachine = StateMachine({
            ['idle'] = function() return RocketIdleState(rocket) end,
            ['flying'] = function() return RocketFlyingState(rocket) end,
        })
        rocket:changeState('idle')
        table.insert(self.rockets, rocket)
    end
end

function Wave:maybeSpawnPowerup(chance, def)
    if (math.random(chance) == 1) then
        local y = math.random(1, self.liveArea - def.height)
        local x = math.random(1, VIRTUAL_WIDTH - def.width)
        self.powerup = Powerup(def, x, y)
        self.powerup:changeAnimation('base')
        gSounds['powerup-appears']:stop()
        gSounds['powerup-appears']:play()
        Timer.tween(1, {
            [self.powerup] = { transitionAlpha = 255 }
        }):finish(function() 
            Timer.after(self.powerupDuration, function() 
                Timer.tween(1, {
                    [self.powerup] = { transitionAlpha = 0 }
                }):finish(function()
                    self.powerup.remove = true
                end)
            end)
        end)
    end
end

function Wave:getAlienCount()
    local count = 0  
    for _, alien in pairs(self.aliens) do
        if not alien.hit then
            count = count + 1
        end
    end
    return count
end

function Wave:cleanupEntities(entityTable)
    for i = #entityTable, 1, -1 do
        -- Remove entity when it scrolls offscreen
        if entityTable[i].x <= 0 or
           not entityTable[i].active or
           entityTable[i].remove then
            table.remove(entityTable, i)
        end
    end
end
