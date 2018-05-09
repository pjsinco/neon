RocketIdleState = Class({ __includes = BaseState })

function RocketIdleState:init(rocket)
    self.rocket = rocket
    self.rocket:changeAnimation('idle')
    self.rocket.dx = -SCROLL_SPEED

    self.timer = Timer.every(1, function()
        if math.random(2) == 1 then
            self.rocket:changeState('flying')
            self.timer:remove()
        end
    end)
end

function RocketIdleState:update(dt)
    self.rocket.currentAnimation:update(dt)
    self.rocket.x = self.rocket.x + self.rocket.dx * dt
end

function RocketIdleState:processAi(params, dt)
end

function RocketIdleState:render()
    love.graphics.setColor({255, 0, 0, 255})

    self.rocket:render()
end
