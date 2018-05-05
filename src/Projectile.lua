Projectile = Class({ __includes = Entity })

function Projectile:init(params)
    Entity.init(self, params)
    self:changeAnimation('glowing')
    self.width = params.width
    self.height = params.height
print_r(self.animations)
end

function Projectile:update(dt)
    self.x = self.x + self.dx * dt
    self.currentAnimation:update(dt)
end

function Projectile:render()
    Entity.render(self)
end
