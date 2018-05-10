Ship = Class({ __includes = Entity })

function Ship:init(params)
    Entity.init(self, params)

    self.width = 21
    self.height = 34
    self.projectiles = {}
    self.inPlay = true
    self.invulnerable = false

    Event.on('player-collided', function(player, other)
        Chain( 
            function(go)
                player:changeState('idle') 
                player.inPlay = false
                gSounds['explosion-1']:stop()
                gSounds['explosion-1']:play()
                go()
            end,
            player:generateExplode(), 
            function(go)
                player.x = 16
                player.y = VIRTUAL_HEIGHT / 2 - (player.height / 2)
                player:changeState('moving')
                player.inPlay = true
                go()
            end
        )()
    end)
end

function Ship:update(dt)
    Entity.update(self, dt)

    if self.inPlay and love.keyboard.wasPressed('space') then
        gSounds['laser-1']:stop()
        gSounds['laser-1']:play()
        table.insert(self.projectiles, Projectile({
            x = self.x + self.width - 8,
            y = self.y + (self.height / 2),
            width = ENTITY_DEFS['projectile-1'].width,
            height = ENTITY_DEFS['projectile-1'].height,
            speed = ENTITY_DEFS['projectile-1'].speed,
            texture = ENTITY_DEFS['projectile-1'].texture,
            animations = ENTITY_DEFS['projectile-1'].animations,
        }))
    end

    for _, projectile in pairs(self.projectiles) do
        projectile:update(dt)
    end
end

function Ship:render()
    for _, projectile in pairs(self.projectiles) do
        if projectile.active then
            projectile:render(dt)
        end
    end
    
    if self.invulnerable then
        love.graphics.setColorMask(math.random(2) == 1,
                                   math.random(2) == 1,
                                   math.random(2) == 1,
                                   true)
        Entity.render(self)
        love.graphics.setColorMask(true, true, true, true)
    else
        Entity.render(self)
    end
end

function Ship:collidesWithTerrain(terrain)
    local terrainHitbox = terrain:getLocalHitbox(self.x, self.width)
    return Entity.collides(self, terrainHitbox)
end
