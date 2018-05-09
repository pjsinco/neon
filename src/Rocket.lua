Rocket = Class({ __includes = Entity })

function Rocket:init(params)
    Entity.init(self, params)
    self:changeAnimation('idle')
    self.width = params.width
    self.height = params.height
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

