--[[
   Neon
]]

require 'src/Dependencies'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    backgroundScroll = 0
    groundScroll = 0

    math.randomseed(os.time())

    love.window.setTitle('Neon, The Arcade Game')

    push:setupScreen(VIRTUAL_WIDTH,
                     VIRTUAL_HEIGHT,
                     WINDOW_WIDTH,
                     WINDOW_HEIGHT,
                     { vsync = true, fullscreen = false, resizable = true })

    gStateMachine = StateMachine({
        ['title'] = function() return TitleScreenState({}) end,
        ['countdown'] = function() return CountdownState({}) end,
        ['play'] = function() return PlayState({}) end,
        ['game-over'] = function() return GameOverState({}) end,
    })
    gStateMachine:change('title')

    love.keyboard.keysPressed = {} 
end

function love.update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit() 
    end

    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % 
                       BACKGROUND_LOOPING_POINT

    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()

    love.graphics.draw(gTextures['space'], -backgroundScroll, 0)

    gStateMachine:render()

    push:finish()
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.resize(w, h)
    push:resize(w, h)
end
