Terrain = Class({})

function Terrain:init(params)
    self.width = math.floor(VIRTUAL_WIDTH / TILE_SIZE)
    self.maxHeight = math.floor(VIRTUAL_HEIGHT / TILE_SIZE)
    self.category = 'terrain' -- identifier for event handling
    self.gridX = 0 -- starting x position for terrain
    self.gridYs = self:generateGridYs(self.width + 1) -- table of y values
    
    self.leadingX = 0

    self.dx = TERRAIN_SCROLL_SPEED
end

function Terrain:update(dt)
    self.leadingX = self.leadingX - self.dx * dt

    -- Make sure we're removing terrain when we dont' need it anymore
    assert(#self.gridYs < self.width + 10, 'Failed to remove unneeded terrain')
end

function Terrain:render()
    love.graphics.setColor({ 0, 255, 0, 255 })

    for i = 1, #self.gridYs do
        local x = (self.leadingX) + (TILE_SIZE * i)

        love.graphics.rectangle('line',
                                x,
                                VIRTUAL_HEIGHT - (self.gridYs[i] * TILE_SIZE),
                                TILE_SIZE,
                                TILE_SIZE)
    end

    if self.leadingX < (0 - TILE_SIZE * 2) then
        -- based on the final y
        local newY = self:generateY(self.gridYs[#self.gridYs]) 

        table.remove(self.gridYs, 1)
        table.insert(self.gridYs, #self.gridYs + 1, newY)
        self.leadingX = self.leadingX + TILE_SIZE -- reset leadingX
    end

    love.graphics.setColor({ 255, 255, 255, 255 })

    -- debug for player and hurtbox collision rects
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.player.x, self.player.y, self.player.width, self.player.height)
    -- love.graphics.rectangle('line', self.swordHurtbox.x, self.swordHurtbox.y,
    --     self.swordHurtbox.width, self.swordHurtbox.height)
    -- love.graphics.setColor(255, 255, 255, 255)


end

--[[
   Generate a list of numbers, with each no more than 1 greater or less than 
   its neighbor.
]]
function Terrain:generateGridYs(count)
    local currentY = math.random(1, 5)
    local ys = {}
    for i = 1, count do
        currentY = self:generateY(currentY)
        table.insert(ys, currentY)
    end
    return ys
end

--[[
    Generate a new Y value, the same or one off from the passed-in value
]]
function Terrain:generateY(yBase)
    local nextY = math.random(2) - 1
    local add = math.random(2) -- whether to add or subtract
    if (add % 2 == 0) then
      yBase = yBase + nextY
    else
      if yBase > 1 then -- make sure y is always above 0
        yBase = yBase - nextY
      end
    end

    return yBase
end

--[[
   Create a hitbox, of the passed-in width, over the portion of the terrain
   starting at x. 
]]
function Terrain:getLocalHitbox(x, width)
    local gridY = self:pointToTile(x)
    local worldY = self:tileToPoint(gridY) 
    return Hitbox(x, worldY, width, TILE_SIZE * 2)
end

--[[
   Return the y value in world space of the given grid-y value
]]
function Terrain:tileToPoint(y)
    return VIRTUAL_HEIGHT - (TILE_SIZE * y)
end

--[[
   Return the grid-y value of the given x in world space
]]
function Terrain:pointToTile(x)
    if x < 0 or 
       x > self.width * TILE_SIZE then
       --y < 0 or 
       --y > self.height * TILE_SIZE then
        return nil
    end
    
    return self.gridYs[math.floor(x / TILE_SIZE) + 1]
end

-- TODO Needed?
function Terrain:generateColumn(len, x)
    local col = {}
    
    for i = 1, len do
        local yPos = (VIRTUAL_HEIGHT - TERRAIN_TILE_HEIGHT) - (i * TERRAIN_TILE_HEIGHT)
        table.insert(col, TerrainTile({ 
            x = x,
            y = yPos,
            color = { 0, 255, 0, 255 }
        }))
    end

    return col
end

