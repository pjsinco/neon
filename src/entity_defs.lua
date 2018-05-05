ENTITY_DEFS = {
    ['player'] = {
        speed = SHIP_SPEED,
        animations = {
            ['idle'] = {
                frames = { 1 },
                interval = 0.15,
                texture = 'ship',
            },
            ['move-up'] = {
                frames = { 3 },
                interval = 0.15,
                texture = 'ship',
            },
            ['move-down'] = {
                frames = { 2 },
                interval = 0.15,
                texture = 'ship',
            },
        }
    },
    ['alien-1'] = {
        speed = SCROLL_SPEED,
        animations = {
            ['static'] = {
                frames = { 3, 2, 1, 2 },
                interval = 0.15,
                texture = 'alien-ship-gray',
            },
            ['move'] = {
                frames = { 3, 2, 1, 2 },
                interval = 0.15,
                texture = 'alien-ship-gray',
            },
        }
    },
    ['projectile-1'] = {
        speed = SHIP_PROJECTILE_SPEED,
        animations = {
            ['glowing'] = {
                frames = { 1, 2 },
                interval = 0.15,
                texture = 'projectile-1',
            },
        }
    },
}
