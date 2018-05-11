RocketIdleState = Class({ __includes = BaseState })

function RocketIdleState:init(rocket)
    self.rocket = rocket
    self.rocket:changeAnimation('idle')
    self.rocket.dx = -SCROLL_SPEED

    self.timers = {}

    self.timer = Timer.every(2, function()
        if math.random(2) == 1 then
            self.rocket:changeState('flying')
            self.timer:remove()
        end
    end):group(self.timers)
end

function RocketIdleState:update(dt)
    Timer.update(dt, self.timers)
    self.rocket.currentAnimation:update(dt)
    self.rocket.x = self.rocket.x + self.rocket.dx * dt
end

function RocketIdleState:processAi(params, dt)
end

function RocketIdleState:render()
    self.rocket:render()
end
