AlienShip = Class({ __includes = Entity })

function AlienShip:init(params)
    Entity.init(self, params)

    self.width = 26
    self.height = 22

    Event.on('collided', function(entity1, entity2) 
        if entity1 == self then
            Chain(
                function(go)
                    self:changeAnimation('exploding', go)
                end,
                function(go)
                    self.active = false
                    return go
                end
            )()
        end
    end)
end

function AlienShip:update(dt)
    Entity.update(self, dt)
end

function AlienShip:render()
    if self.active then
        Entity.render(self)
    end
end

function AlienShip:onCollide(finish)
    Entity.onCollide(self)
    self:changeAnimation('exploding')
    self.dx, self.dy = 0, 0
    finish()
end
