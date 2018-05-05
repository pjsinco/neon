AlienMovingState = Class({ __includes = BaseState })

function AlienMovingState:init(alien)
    self.alien = alien
    self.alien:changeAnimation('move')
end

function AlienMovingState:enter(params)
end

function AlienMovingState:update(dt)
    self.alien:update(dt)
end

function AlienMovingState:render()
    self.alien:render()
end

