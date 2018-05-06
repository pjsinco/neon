AlienShip = Class({ __includes = Entity })

function AlienShip:init(params)
    Entity.init(self, params)

    self.width = 26
    self.height = 22
    self.value = params.value

    Event.on('alien-collided-with-projectile', function(alien, _) 

        if alien == self then
            if not self.hit then
                Event.dispatch('scored', self.value)
            end
            self.hit = true

            gSounds['explosion-1']:stop()
            gSounds['explosion-1']:play()
            Chain( self:generateExplode(), self:generateDeactivate() )()
        end
    end)

    Event.on('player-collided-with-alien', function(_, alien) 
        if alien == self then
            gSounds['explosion-1']:stop()
            gSounds['explosion-1']:play()
            Chain( self:generateExplode(), self:generateDeactivate() )()
        end
    end)
end


function AlienShip:update(dt)
    Entity.update(self, dt)
end

function AlienShip:render()
    --if self.active then
        Entity.render(self)
    --end
end

function AlienShip:onCollide(finish)
    Entity.onCollide(self)
    self:changeAnimation('exploding')
    self.dx, self.dy = 0, 0
    finish()
end
