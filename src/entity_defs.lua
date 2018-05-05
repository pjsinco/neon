ENTITY_DEFS = {
    ['player'] = {
        shipSpeed = SHIP_SPEED,
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
        shipSpeed = SHIP_SPEED,
        animations = {
            ['move'] = {
                frames = { 1 },
                interval = 0.15,
                texture = 'alien-ship-1',
            },
        }
    },
}
