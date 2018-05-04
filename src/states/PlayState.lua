PlayState = Class({ __includes = BaseState })

function PlayState:init(params)
    self.ship = Ship({ x = 16, y = VIRTUAL_HEIGHT / 2 })
end

function PlayState:enter(params)

end

function PlayState:update(dt)
    self.ship:update(dt)
end

function PlayState:render()
    self.ship:render()    
end
