AlienShip = Class({ __includes = Entity })

function AlienShip:init(params)
    Entity.init(self, params)

    self.width = 26
    self.height = 22
    self.value = params.value

    Event.on('alien-collided', function(alien, other) 
        if alien == self then
            if not self.hit then
                Event.dispatch('scored', self.value)
            end
            self.hit = true
            self.dx, self.dy = 0, 0
            gSounds['explosion-1']:stop()
            gSounds['explosion-1']:play()
            Chain( self:generateExplode(), self:generateDeactivate() )()
        end
    end)

    Event.on('player-collided', function(player, other) 
        if other == self then
            if not self.hit then
                Event.dispatch('scored', self.value)
            end
            self.hit = true
            self.dx, self.dy = 0, 0
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
    Entity.render(self)
end
