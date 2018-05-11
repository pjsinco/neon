Class = require 'lib/class'
push = require 'lib/push'

require 'src/constants'

require 'src/StateMachine'
require 'src/Util'
require 'src/Animation'

require 'src/states/BaseState'
require 'src/states/game/CountdownState'
require 'src/states/game/PlayState'
require 'src/states/game/TitleScreenState'
require 'src/states/game/GameOverState'

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
require 'src/GameMessage'

require 'src/entity_defs'
require 'src/wave_defs'

Timer = require 'lib/knife/timer'
Event = require 'lib/knife/event'
Chain = require 'lib/knife/chain'

gTextures = {
    ['ship'] = love.graphics.newImage('graphics/spaceships-indexed.png'),
    ['space'] = love.graphics.newImage('graphics/space-indexed.png'),
    ['afterburners'] = love.graphics.newImage('graphics/afterburners-1.png'),
    ['alien-ship-1'] = love.graphics.newImage('graphics/alien-ship-1.png'),
    ['alien-ship-pink'] = love.graphics.newImage('graphics/ship-small-pink.png'),
    --['alien-ship-green'] = 
        --love.graphics.newImage('graphics/alien-ships-green-1.png'),
    ['projectile-1'] = love.graphics.newImage('graphics/projectiles-indexed.png'),
    ['explosion'] = love.graphics.newImage('graphics/explosions-indexed.png'),
    ['rocket'] = love.graphics.newImage('graphics/rockets-indexed.png'),
    ['particle'] = love.graphics.newImage('graphics/particle.png'),
    ['globe'] = love.graphics.newImage('graphics/globes-indexed.png'),
    ['fuel'] = love.graphics.newImage('graphics/fuel-tank-indexed.png'),
}

gFrames = {
    ['ship'] = GenerateQuads(gTextures['ship'], 21, 34),
    ['afterburners'] = GenerateQuads(gTextures['afterburners'], 10, 7),
    ['alien-ship-1'] = GenerateQuads(gTextures['alien-ship-1'], 26, 22),
    --['alien-ship-green'] = 
        --GenerateQuads(gTextures['alien-ship-green'], 37, 40),
    ['alien-ship-pink'] = 
        GenerateQuads(gTextures['alien-ship-pink'], 18, 20),
    ['projectile-1'] = GenerateQuads(gTextures['projectile-1'], 12, 1),
    ['explosion'] = GenerateQuads(gTextures['explosion'], 16, 16),
    ['rocket'] = GenerateQuads(gTextures['rocket'], 9, 17),
    ['globe'] = GenerateQuads(gTextures['globe'], 28, 28),
    ['fuel'] = GenerateQuads(gTextures['fuel'], 40, 20),
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
    ['powerup'] = love.audio.newSource('sounds/Powerup38.wav', 'static'),
    ['theme'] = love.audio.newSource('sounds/maintheme.mp3', 'static'),
    ['theme-alt'] = 
        love.audio.newSource('sounds/maintheme-alt-1.mp3', 'static'),
    ['theme-srd'] = 
        love.audio.newSource('sounds/maintheme-alt-1.mp3', 'static'),
    ['coin'] = love.audio.newSource('sounds/coin.mp3', 'static'),
    ['game-over'] = love.audio.newSource('sounds/gameover.mp3', 'static'),
    ['invulnerable'] = 
        love.audio.newSource('sounds/invulnerable.mp3', 'static'),
    ['powerup-appears'] = 
        love.audio.newSource('sounds/powerup-appears.wav', 'static'),
    ['sfx-8'] = love.audio.newSource('sounds/sfx8.mp3', 'static'),
    ['sfx-11'] = love.audio.newSource('sounds/sfx11.mp3', 'static'),
    ['glitch'] = love.audio.newSource('sounds/sfx17.mp3', 'static'),
}

gColors = {
    ['green']  = { 0  , 255, 0  , 255 },
    ['red']    = { 255, 0  , 0  , 255 },
    ['yellow'] = { 255, 255, 0  , 255 },
    ['blue']   = { 0  , 0  , 255, 255 },
    ['cyan']   = { 0  , 255, 255, 255 },
    ['pink']   = { 255, 0  , 255, 255 },
    ['black']  = { 0  , 0  , 0  , 255 },
    ['white']  = { 255, 255, 255, 255 },
}
