Ship = Class({})

function Ship:init(params)
    self.animation = Animation({
        texture = gTextures['ship'],
        frames = {1},
        interval = 0.15,
    })
    
    self.x = params.x
    self.y = params.y
    self.dy = SHIP_SPEED
    self.dx = SHIP_SPEED

    self.width = 21
    self.height = 34
end

function Ship:update(dt)
    self.animation:update(dt)

    if love.keyboard.isDown('up') then
        self.y = math.max(0, self.y - self.dy * dt)
    elseif love.keyboard.isDown('down') then
        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
    elseif love.keyboard.isDown('left') then
        self.x = math.max(0, self.x - self.dx * dt)
    elseif love.keyboard.isDown('right') then
        self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx * dt)
    end
end

function Ship:render()
    love.graphics.draw(self.animation.texture,
                       gFrames['ship'][self.animation:getCurrentFrame()],
                       math.floor(self.x),
                       math.floor(self.y))
end
