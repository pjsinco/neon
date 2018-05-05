Class = require 'lib/class'
push = require 'lib/push'

require 'src/constants'

require 'src/StateMachine'
require 'src/Util'
require 'src/Animation'

require 'src/states/BaseState'
require 'src/states/game/CountdownState'
require 'src/states/game/PlayState'
require 'src/states/game/ScoreState'
require 'src/states/game/TitleScreenState'

require 'src/states/entity/ShipIdleState'
require 'src/states/entity/ShipMovingState'

require 'src/Ship'
require 'src/AlienShip'
require 'src/Terrain'
require 'src/TerrainTile'

Timer = require 'lib/knife/timer'

gTextures = {
    ['ship'] = love.graphics.newImage('graphics/spaceships-2.png'),
    ['space'] = love.graphics.newImage('graphics/space-1.png'),
    ['afterburners'] = love.graphics.newImage('graphics/afterburners-1.png'),
    ['alien-ship-1'] = love.graphics.newImage('graphics/alien-ship-1.png'),
    ['alien-ship-1'] = love.graphics.newImage('graphics/alien-ship-1.png'),
}

gFrames = {
    ['ship'] = GenerateQuads(gTextures['ship'], 21, 34),
    ['afterburners'] = GenerateQuads(gTextures['afterburners'], 10, 7),
    ['alien-ship-1'] = GenerateQuads(gTextures['alien-ship-1'], 26, 22),
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['image'] = love.graphics.newImageFont('fonts/imagefont-1.png',
        " abcdefghijklmnopqrstuvwxyz" ..
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
        "123456789.,!?-+/():;%&`'*#=[]\"")

}

gSounds = {
    --['score'] = love.audio.newSource('sounds/score.wav', 'static'),
    --['music'] = love.audio.newSource('sounds/marios_way.mp3', 'static'),
}
