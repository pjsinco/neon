Ship = Class({ __includes = Entity })

function Ship:init(params)
    Entity.init(self, params)

    self.width = 21
    self.height = 34
end

function Ship:update(dt)
    Entity.update(self, dt)
--    if love.keyboard.isDown('up') then
--        self.y = math.max(0, self.y - self.dy * dt)
--    elseif love.keyboard.isDown('down') then
--        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
--    elseif love.keyboard.isDown('left') then
--        self.x = math.max(0, self.x - self.dx * dt)
--    elseif love.keyboard.isDown('right') then
--        self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx * dt)
--    end
end

function Ship:render()
    Entity.render(self)
end
