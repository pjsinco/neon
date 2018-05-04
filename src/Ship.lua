Ship = Class({})

function Ship:init(params)
    self.animation = Animation({
        texture = gTextures['ship'],
        frames = {1},
        interval = 0.15,
    })
    
    self.x = params.x
    self.y = params.y
    
    self.width = 21
    self.height = 34
end

function Ship:update(dt)
    self.animation:update(dt)

    
end

function Ship:render()
    love.graphics.draw(self.animation.texture,
                       gFrames['ship'][self.animation:getCurrentFrame()],
                       math.floor(self.x),
                       math.floor(self.y))
end
