Powerup = Class({ __includes = Entity })

function Powerup:init(params, x, y)
    Entity.init(self, params)
    self.x = x
    self.y = y
end

function Powerup:update(dt)
    Entity.update(self, dt)
    self.x = self.x + self.dx * dt
    self.currentAnimation:update(dt)
end

function Powerup:render()
    Entity.render(self)
end
