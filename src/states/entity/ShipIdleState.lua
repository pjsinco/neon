ShipIdleState = Class({ __includes = BaseState })

function ShipIdleState:init(ship)
    self.ship = ship
    --self.ship:changeAnimation('idle')
end

function ShipIdleState:enter(params)
    --self.ship.currentAnimation:refresh()
end

function ShipIdleState:exit()
end

function ShipIdleState:update(dt)
    self.ship.currentAnimation:update(dt)
    --if love.keyboard.isDown('up') or
       --love.keyboard.isDown('down') or
       --love.keyboard.isDown('left') or
       --love.keyboard.isDown('right') then 
            --self.ship:changeState('moving')
    --end
end

function ShipIdleState:render()
    self.ship:render()
end
