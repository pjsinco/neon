ShipMovingState = Class({ __includes = BaseState })

function ShipMovingState:init(ship)
    self.ship = ship
    self.direction = nil
end

function ShipMovingState:update(dt)
    if love.keyboard.isDown('up') then
        self.ship:changeAnimation('move-up')
        self.ship.y = math.max(0, self.ship.y - self.ship.dy * dt)
    elseif love.keyboard.isDown('down') then
        self.ship:changeAnimation('move-down')
        self.ship.y = math.min(VIRTUAL_HEIGHT - self.ship.height, 
                               self.ship.y + self.ship.dy * dt)
    else
        self.ship:changeState('idle')
    end
end

function ShipMovingState:render()
    self.ship:render()
end

