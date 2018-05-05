AlienStaticState = Class({ __includes = BaseState })

function AlienStaticState:init(alien)
    self.alien = alien
    self.alien:changeAnimation('static')
end

function AlienStaticState:enter(params)
end

function AlienStaticState:update(dt)
    self.alien.x = self.alien.x - self.alien.dx * dt
    self.alien.currentAnimation:update(dt)
end

function AlienStaticState:render()
    self.alien:render()
end


