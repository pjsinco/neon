AlienShip = Class({ __includes = Entity })

function AlienShip:init(params)
    Entity.init(self, params)

    self.width = 26
    self.height = 22
end

function AlienShip:update(dt)
    Entity.update(self, dt)
end

function AlienShip:render()
    Entity.render(self)
end

function AlienShip:onCollide()
    Entity.onCollide(self)
    self:changeAnimation('exploding')
    self.dx, self.dy = 0, 0
end
