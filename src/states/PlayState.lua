PlayState = Class({ __includes = BaseState })

function PlayState:init(params)
    self.ship = Ship({ x = 16, y = VIRTUAL_HEIGHT / 2 })

    self.terrain = Terrain()
end

function PlayState:enter(params)

end

function PlayState:update(dt)
    self.ship:update(dt)
    self.terrain:update(dt)
end

function PlayState:render()
    self.ship:render()    
    self.terrain:render()
end
