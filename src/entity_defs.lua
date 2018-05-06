ENTITY_DEFS = {
    ['player'] = {
        speed = SHIP_SPEED,
        animations = {
            ['idle'] = {
                frames = { 1 },
                interval = 0.15,
                texture = 'ship',
                looping = true,
            },
            ['move-up'] = {
                frames = { 3 },
                interval = 0.15,
                texture = 'ship',
                looping = true,
            },
            ['move-down'] = {
                frames = { 2 },
                interval = 0.15,
                texture = 'ship',
                looping = true,
            },
            ['exploding'] = {
                frames = { 8, 7, 6, 5, 4, 3, 2, 1 },
                interval = 0.07,
                looping = false,
                texture = 'explosion',
            }
        }
    },
    ['alien-1'] = {
        speed = SCROLL_SPEED,
        animations = {
            ['static'] = {
                frames = { 3, 2, 1, 2 },
                interval = 0.15,
                texture = 'alien-ship-gray',
                looping = true,
            },
            ['move'] = {
                frames = { 3, 2, 1, 2 },
                interval = 0.15,
                texture = 'alien-ship-gray',
                looping = true,
            },
            ['exploding'] = {
                frames = { 8, 7, 6, 5, 4, 3, 2, 1 },
                interval = 0.07,
                looping = false,
                texture = 'explosion',
            }
        }
    },
    ['projectile-1'] = {
        speed = SHIP_PROJECTILE_SPEED,
        width = 6,
        height = 3,
        animations = {
            ['glowing'] = {
                frames = { 1, 2 },
                interval = 0.15,
                texture = 'projectile-1',
                looping = true,
            },
        }
    },
}
