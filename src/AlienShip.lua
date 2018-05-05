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
