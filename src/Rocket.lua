Rocket = Class({ __includes = Entity })

function Rocket:init(params)
    Entity.init(self, params)
    self:changeAnimation('idle')
    self.value = params.value

    Event.on('rocket-collided', function(rocket)
        if rocket == self then
            if not self.hit then
                Event.dispatch('scored', self.value)
            end
            self.hit = true
            self.dx, self.dy = 0, 0
            gSounds['explosion-2']:stop()
            gSounds['explosion-2']:play()
            Chain( self:generateExplode(), self:generateDeactivate() )()
        end
    end)

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

