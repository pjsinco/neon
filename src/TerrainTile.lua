TerrainTile = Class({})

function TerrainTile:init(params)
    self.width = TERRAIN_TILE_WIDTH
    self.height = TERRAIN_TILE_HEIGHT
    self.x = params.x
    self.y = params.y
    self.color = params.color
end

function TerrainTile:render()
    love.graphics.setColor(self.color)
    love.graphics.rectangle('line',
                            self.x,
                            self.y,
                            self.width,
                            self.height)
end

