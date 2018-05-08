AlienMovingState = Class({ __includes = BaseState })

function AlienMovingState:init(alien)
    self.alien = alien
    self.alien:changeAnimation('move')

    -- zig-zag movement
    self.alien.minY = self.alien.y - 10
    self.alien.maxY = self.alien.y + 10
end

function AlienMovingState:enter(params)
end

function AlienMovingState:update(dt)
    if self.alien.y < self.alien.minY or
       self.alien.y > self.alien.maxY then
        self.alien.dy = -self.alien.dy
    end

    self.alien.y = self.alien.y + self.alien.dy * dt
    self.alien.x = self.alien.x - self.alien.dx * dt
    self.alien.currentAnimation:update(dt)
end

function AlienMovingState:render()
    self.alien:render()
end

