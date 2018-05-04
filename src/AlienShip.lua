AlienShip = Class({})

function AlienShip:init(params)
    self.animation = Animation({
        texture = gTextures['alien-ship-1'],
        frames = {1},
        interval = 0.15,
    })
    
    self.x = params.x
    self.y = params.y
    
    self.width = 26
    self.height = 22
end

function AlienShip:update(dt)
    self.animation:update(dt)
end

function AlienShip:render()
    love.graphics.draw(self.animation.texture,
                       gFrames['alien-ship-1'][self.animation:getCurrentFrame()],
                       math.floor(self.x),
                       math.floor(self.y))
end
