WAVE_DEFS = {
    ['zigzag'] = {
        speedMultiplier = 1,
        alienCount = 8,
        duration = 10,
        rocketCount = 5,
        terrainMinHeight = 1,
        terrainMaxHeight = 3,
        maybeSpawnRocketSeconds = 2,
        maybeSpawnRocketChance = 2,
        --maybeSpawnPowerupSeconds = math.random(5, 10), -- every n seconds
        maybeSpawnPowerupSeconds = 2, -- every n seconds
        maybeSpawnPowerupChance = 2, -- 1 in n
        powerupDuration = 5,
        powerups = { 'fuel-1' },
    },
    ['zigzag-2'] = {
        speedMultiplier = 1.25,
        alienCount = 16,
        duration = 10,
        rocketCount = 10,
        terrainMinHeight = 4,
        terrainMaxHeight = 8,
        maybeSpawnRocketSeconds = 1,
        maybeSpawnRocketChance = 2,
        --maybeSpawnPowerupSeconds = math.random(5, 10), -- every n seconds
        maybeSpawnPowerupSeconds = 2, -- every n seconds
        maybeSpawnPowerupChance = 5, -- 1 in n
        powerupDuration = 5,
        powerups = { 'fuel-1', 'globe-1' },
    }
}
