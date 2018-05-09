RocketFlyingState = Class({ __includes = BaseState })

function RocketFlyingState:init(rocket)
    self.rocket = rocket
    self.rocket:changeAnimation('idle')
end

function RocketFlyingState:enter(params)
    self.rocket:changeAnimation('flying')
end

function RocketFlyingState:update(dt)
    self.rocket.currentAnimation:update(dt)
    self.rocket.y = self.rocket.y + self.rocket.dy * dt
end

function RocketIdleState:processAi()
end

function RocketFlyingState:render()
    self.rocket:render()
end

