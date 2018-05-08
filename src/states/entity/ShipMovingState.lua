ShipMovingState = Class({ __includes = BaseState })

function ShipMovingState:init(ship)
    self.ship = ship
    self.direction = nil
    self.ship:changeAnimation('idle', function() end)
end

function ShipMovingState:enter(params)
    self.ship.active = true
    self.ship:changeAnimation('idle', function() end)
    self.ship.currentAnimation:refresh()
end

function ShipMovingState:update(dt)
    self.ship.currentAnimation:update(dt)

    if love.keyboard.isDown('up') then
        self.ship:changeAnimation('move-up')
        self.ship.y = math.max(0, self.ship.y - self.ship.dy * dt)
    elseif love.keyboard.isDown('down') then
        self.ship:changeAnimation('move-down')
        self.ship.y = math.min(VIRTUAL_HEIGHT - self.ship.height, 
                               self.ship.y + self.ship.dy * dt)
    elseif love.keyboard.isDown('left') then
        self.ship.x = math.max(0, self.ship.x - self.ship.dx * dt)
    elseif love.keyboard.isDown('right') then
        self.ship.x = math.min(VIRTUAL_WIDTH - self.ship.width, 
                               self.ship.x + self.ship.dx * dt)
    else
        if self.ship.active then
            self.ship:changeAnimation('idle')
        end
    end
end

function ShipMovingState:render()
    --self.ship:render()
end
