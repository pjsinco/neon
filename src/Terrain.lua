Terrain = Class({})

function Terrain:init(params)
    self.width = 50 -- tiles wide
    self.maxHeight = 11 -- tiles tall

    self.gridX = 0 -- starting x position for terrain
    self.gridYs = self:generateGridYs(self.width) -- table of y values

    
    self.leadingX = 0

    self.dx = TERRAIN_SCROLL_SPEED
end

function Terrain:update(dt)
    self.leadingX = self.leadingX - self.dx * dt

    assert(#self.gridYs < 52, 'Failed to remove unneeded terrain')
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
        local newY = self:generateY(self.gridYs[#self.gridYs]) -- based on the final y
        table.remove(self.gridYs, 1)
        table.insert(self.gridYs, #self.gridYs + 1, newY)
        self.leadingX = self.leadingX + TILE_SIZE -- reset leadingX
    end
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
