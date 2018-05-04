Terrain = Class({})

function Terrain:init(params)
    self.terrainCol = self:generateColumn(3, VIRTUAL_WIDTH - 12)
    --self.x = VIRTUAL_WIDTH - self.width 
    --self.y = VIRTUAL_HEIGHT - self.height
    --self.color = { 0, 255, 0, 255 }
    
    self.dx = TERRAIN_SCROLL_SPEED
end

function Terrain:update(dt)
    for _, tile in pairs(self.terrainCol) do
        tile.x = tile.x - (self.dx * dt)
    end
end

function Terrain:render()
    for _, tile in pairs(self.terrainCol) do
        tile:render()
    end
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
