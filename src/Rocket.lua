Rocket = Class({ __includes = Entity })

function Rocket:init(params)
    Entity.init(self, params)
    self:changeAnimation('idle')
end

function Rocket:update(dt)
    Entity.update(self, dt)

    --self.y = self.y - self.dy * dt
    --self.x = self.x + self.dx * dt
    self.currentAnimation:update(dt)
end

function Rocket:render()
    Entity.render(self)
end

