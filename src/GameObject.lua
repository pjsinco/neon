--[[
    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(params)
    self.x = params.x
    self.y = params.y
    self.texture = params.texture
    self.width = params.width
    self.height = params.height
    self.frame = params.frame
    self.solid = params.solid
    self.collidable = params.collidable
    self.consumable = params.consumable
    self.onCollide = params.onCollide
    self.onConsume = params.onConsume
    self.hit = params.hit
end

function GameObject:collides(target)
    return not (target.x > self.x + self.width or self.x > target.x + target.width or
            target.y > self.y + self.height or self.y > target.y + target.height)
end

function GameObject:render()
    love.graphics.draw(gTextures[self.texture],
                       gFrames[self.texture][self.frame],
                       self.x,
                       self.y)
end
