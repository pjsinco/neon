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
        maybeSpawnPowerupSeconds = 5, -- every n seconds
        maybeSpawnPowerupChance = 15, -- 1 in n
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
        maybeSpawnPowerupSeconds = 3, -- every n seconds
        maybeSpawnPowerupChance = 15, -- 1 in n
        powerups = { 'fuel-1', 'globe-1' },
    }
}
