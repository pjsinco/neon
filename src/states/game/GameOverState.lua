GameOverState = Class({ __includes = BaseState })

function GameOverState:init()
    self.score = nil
    self.timers = {}
    gSounds['game-over']:play()
    Timer.after(2.3, function()
        gSounds['theme-alt']:setLooping(true)
        gSounds['theme-alt']:play()
    end):group(self.timers)

    Timer.after(10, function()
    end):group(self.timers)
end

function GameOverState:enter(params)
    self.score = params.score
end

function GameOverState:update(dt)
    Timer.update(dt, self.timers)

    if love.keyboard.wasPressed('enter') or
       love.keyboard.wasPressed('return') then
        gSounds['coin']:play()
        gStateMachine:change('play', { score = 0 })
    end
        
end

function GameOverState:exit()
    love.audio.stop()
end

function GameOverState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Neon', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['image'])
    love.graphics.setColor(gColors['yellow'])
    love.graphics.printf('The End', 0, 104, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['image'])
    love.graphics.setColor(gColors['red'])
    love.graphics.printf('Press Enter to play again', 0, 132, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(gColors['yellow'])
    love.graphics.print(tostring(self.score),
                        SCREEN_PADDING_LEFT + 30,
                        SCREEN_PADDING_TOP)
end


