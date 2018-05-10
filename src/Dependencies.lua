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
require 'src/states/entity/AlienMovingState'
require 'src/states/entity/AlienStaticState'
require 'src/states/entity/RocketIdleState'
require 'src/states/entity/RocketFlyingState'

require 'src/Entity'
require 'src/GameObject'
require 'src/Ship'
require 'src/AlienShip'
require 'src/Terrain'
require 'src/Projectile'
require 'src/Powerup'
require 'src/Rocket'
require 'src/Wave'
require 'src/Hurtbox'
require 'src/Hitbox'

require 'src/entity_defs'
require 'src/wave_defs'

Timer = require 'lib/knife/timer'
Event = require 'lib/knife/event'
Chain = require 'lib/knife/chain'

gTextures = {
    ['ship'] = love.graphics.newImage('graphics/spaceships-3.png'),
    ['space'] = love.graphics.newImage('graphics/space-1.png'),
    ['afterburners'] = love.graphics.newImage('graphics/afterburners-1.png'),
    ['alien-ship-1'] = love.graphics.newImage('graphics/alien-ship-1.png'),
    ['alien-ship-gray'] = love.graphics.newImage('graphics/ship-small-gray.png'),
    ['alien-ship-green'] = 
        love.graphics.newImage('graphics/alien-ships-green-1.png'),
    ['projectile-1'] = love.graphics.newImage('graphics/projectiles.png'),
    ['explosion'] = love.graphics.newImage('graphics/explosions.png'),
    ['rocket'] = love.graphics.newImage('graphics/rockets-1.png'),
    ['particle'] = love.graphics.newImage('graphics/particle.png'),
    ['globe'] = love.graphics.newImage('graphics/globes.png'),
}

gFrames = {
    ['ship'] = GenerateQuads(gTextures['ship'], 21, 34),
    ['afterburners'] = GenerateQuads(gTextures['afterburners'], 10, 7),
    ['alien-ship-1'] = GenerateQuads(gTextures['alien-ship-1'], 26, 22),
    ['alien-ship-green'] = 
        GenerateQuads(gTextures['alien-ship-green'], 37, 40),
    ['alien-ship-gray'] = 
        GenerateQuads(gTextures['alien-ship-gray'], 18, 20),
    ['projectile-1'] = GenerateQuads(gTextures['projectile-1'], 6, 3),
    ['explosion'] = GenerateQuads(gTextures['explosion'], 16, 16),
    ['rocket'] = GenerateQuads(gTextures['rocket'], 9, 17),
    ['globe'] = GenerateQuads(gTextures['globe'], 28, 28),
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),

    -- https://love2d.org/wiki/Tutorial:Fonts_and_Text
    ['image'] = love.graphics.newImageFont('fonts/imagefont-1.png',
        " abcdefghijklmnopqrstuvwxyz" ..
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
        "123456789.,!?-+/():;%&`'*#=[]\"")
}

gSounds = {
    ['explosion-1'] = love.audio.newSource('sounds/Explosion13.wav', 'static'),
    ['laser-1'] = love.audio.newSource('sounds/Laser_Shoot12.wav', 'static'),
    --['score'] = love.audio.newSource('sounds/score.wav', 'static'),
    --['music'] = love.audio.newSource('sounds/marios_way.mp3', 'static'),
}
