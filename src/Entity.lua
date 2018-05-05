Entity = Class({})

function Entity:init(params)
    self.stateMachine = params.stateMachine or nil
    self.x = params.x
    self.y = params.y
    self.animations = self:createAnimations(params.animations)
    self.dx = params.speed
    self.dy = params.speed
    self.active = true
end

function Entity:update(dt)
    if self.stateMachine ~= nil then
        self.stateMachine:update(dt)
    end
end

function Entity:createAnimations(animations)
    local toReturn = {}

    for k, animDef in pairs(animations) do
        toReturn[k] = Animation({
            texture = animDef.texture,
            frames = animDef.frames,
            interval = animDef.interval,
            looping = animDef.looping,
        })
    end

    return toReturn
end

function Entity:changeAnimation(animation, callback)
    self.currentAnimation = self.animations[animation]
    self.currentAnimation.after = callback or function() end
end

function Entity:render()
    if not self.active then
        return
    end

    local texture = self.currentAnimation.texture
    local frame = gFrames[texture][self.currentAnimation:getCurrentFrame()]
    love.graphics.draw(gTextures[texture],
                       frame,
                       math.floor(self.x),
                       math.floor(self.y))
end

function Entity:changeState(state, params)
    if self.stateMachine ~= nil then
        self.stateMachine:change(state, params)
    end
end

function Entity:collides(other)
    return not (self.x > other.x + other.width or 
                other.x > self.x + self.width or
                self.y > other.y + other.height or 
                other.y > self.y + self.height)
end
