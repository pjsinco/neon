Class = require 'lib/class'
push = require 'lib/push'

require 'src/constants'

require 'src/StateMachine'
require 'src/Util'
require 'src/Animation'

require 'src/states/BaseState'
require 'src/states/CountdownState'
require 'src/states/PlayState'
require 'src/states/ScoreState'
require 'src/states/TitleScreenState'

require 'src/Ship'
require 'src/Terrain'
require 'src/TerrainTile'

Timer = require 'lib/knife/timer'

gTextures = {
    ['ship'] = love.graphics.newImage('graphics/spaceships-2.png'),
    ['space'] = love.graphics.newImage('graphics/space-1.png'),
    ['afterburners'] = love.graphics.newImage('graphics/afterburners-1.png'),
}

gFrames = {
    ['ship'] = GenerateQuads(gTextures['ship'], 21, 34),
    ['afterburners'] = GenerateQuads(gTextures['afterburners'], 10, 7),
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
}

gSounds = {
    --['score'] = love.audio.newSource('sounds/score.wav', 'static'),
    --['music'] = love.audio.newSource('sounds/marios_way.mp3', 'static'),
}
