Terrain = Class({})

function Terrain:init(params)
    self.width = 50 -- tiles wide
    self.maxHeight = 11 -- tiles tall

    self.x = 0

    self.columns = {}

    for i = 1, self.width do
        local col = self:generateColumn(3, TERRAIN_TILE_WIDTH * i)
        table.insert(self.columns, col)
    end

    self.dx = TERRAIN_SCROLL_SPEED
end

function Terrain:update(dt)
    for _, col in pairs(self.columns) do
        for _, tile in pairs(col) do
            tile.x = tile.x - (self.dx * dt)
        end
    end
end

function Terrain:render()
    for _, col in pairs(self.columns) do
        for _, tile in pairs(col) do
            tile:render()
        end
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
