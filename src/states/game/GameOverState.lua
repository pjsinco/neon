GameOverState = Class({ __includes = BaseState })

function GameOverState:init()
    
end

function GameOverState:enter(params)
    gSounds['theme']:stop()
    gSounds['game-over']:play()
end

function GameOverState:update(dt)
    Timer.update(dt)

    if love.keyboard.wasPressed('enter') or
       love.keyboard.wasPressed('return') then
        gSounds['coin']:play()
        gStateMachine:change('play', { score = 0 })
    end
        
end

function GameOverState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('The End', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['image'])
    love.graphics.setColor({ 255, 0, 0, 255 })
    love.graphics.printf('Press Enter', 0, 100, VIRTUAL_WIDTH, 'center')
end


