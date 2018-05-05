ShipIdleState = Class({ __includes = BaseState })

function ShipIdleState:init(ship)
    self.ship = ship
    self.ship:changeAnimation('idle')
end

function ShipIdleState:enter(params)
end

function ShipIdleState:update(dt)
    if love.keyboard.isDown('up') then
        self.ship:changeState('moving')
    elseif love.keyboard.isDown('down') then
        self.ship:changeState('moving')
    end
end

function ShipIdleState:render()
    --self.ship:render()
end
