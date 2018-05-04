Terrain = Class({})

function Terrain:init(params)
    self.width = 50 -- tiles wide
    self.maxHeight = 11 -- tiles tall

    self.x = 0 -- starting x position for terrain
    self.gridYs = self:generateGridYs(self.width) -- table of y values

    self.leadingX = 0

    self.dx = TERRAIN_SCROLL_SPEED
end

function Terrain:update(dt)
    self.leadingX = self.leadingX - self.dx * dt
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
end

--[[
   Generate a list of numbers, with each no more than 1 greater or less than 
   its neighbor.
]]
function Terrain:generateGridYs(count)
    local currentY = 1
    local ys = {}
    for i = 1, count do
        local nextY = math.random(2) - 1
        local add = math.random(2) -- whether to add or subtract
        if (add % 2 == 0) then
          currentY = currentY + nextY
        else
          if currentY > 1 then -- make sure y is always above 0
            currentY = currentY - nextY
          end
        end
        table.insert(ys, currentY)
    end
    return ys
end

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
