--[[
   Much of this class is borrowed from the Legend of Zelda class code
]]

Entity = Class({})

function Entity:init(params)
    self.stateMachine = params.stateMachine or nil
    self.x = params.x
    self.y = params.y
    self.animations = self:createAnimations(params.animations)
    self.dx = params.speed
    self.dy = params.speed
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
            interval = animDef.interval
        })
    end

    return toReturn
end

function Entity:changeAnimation(animation)
    self.currentAnimation = self.animations[animation]
end

function Entity:render()
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
