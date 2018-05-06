Ship = Class({ __includes = Entity })

function Ship:init(params)
    Entity.init(self, params)

    self.width = 21
    self.height = 34

    self.projectiles = {}

    Event.on('player-collided-with-terrain', function(player)
        Chain( 
            self:generateExplode(), 
            self:generateDeactivate()
        )()
    end)

    Event.on('player-collided-with-alien', function(player)
        Chain( 
            self:generateExplode(), 
            self:generateDeactivate()
        )()
    end)
end

function Ship:update(dt)
    Entity.update(self, dt)

    if love.keyboard.wasPressed('space') then
        gSounds['laser-1']:stop()
        gSounds['laser-1']:play()
        table.insert(self.projectiles, Projectile({
            x = self.x + self.width,
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
        projectile:render(dt)
    end

    Entity.render(self)
end

function Ship:collidesWithTerrain(terrain)
    local terrainHitbox = terrain:getLocalHitbox(self.x, self.width)
    return Entity.collides(self, terrainHitbox)
end
