Projectile = Class({ __includes = Entity })

function Projectile:init(params)
    Entity.init(self, params)
    self:changeAnimation('glowing')
end

function Projectile:update(dt)
    self.x = self.x + self.dx * dt
    self.currentAnimation:update(dt)
end

function Projectile:render()
    Entity.render(self)
end
