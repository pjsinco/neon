WAVE_DEFS = {
    {
        alienType = 'alien-1',
        alienState = 'static',
        speedMultiplier = 1,
        alienCount = 8,
        duration = 10,
        --rocketCount = 5,
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
    {
        alienType = 'alien-2',
        alienState = 'moving',
        speedMultiplier = 1.25,
        alienCount = 12,
        duration = 10,
        --rocketCount = 15,
        terrainMinHeight = 5,
        terrainMaxHeight = 10,
        maybeSpawnRocketSeconds = 0.5,
        maybeSpawnRocketChance = 2,
        --maybeSpawnPowerupSeconds = math.random(5, 10), -- every n seconds
        maybeSpawnPowerupSeconds = 2, -- every n seconds
        maybeSpawnPowerupChance = 5, -- 1 in n
        powerupDuration = 5,
        --powerups = { 'fuel-1', 'globe-1' },
        powerups = { 'fuel-1' },
    },
    {
        alienType = 'alien-2',
        alienState = 'moving',
        speedMultiplier = 1.25,
        alienCount = 12,
        duration = 10,
        --rocketCount = 15,
        terrainMinHeight = 5,
        terrainMaxHeight = 10,
        maybeSpawnRocketSeconds = 0.5,
        maybeSpawnRocketChance = 2,
        --maybeSpawnPowerupSeconds = math.random(5, 10), -- every n seconds
        maybeSpawnPowerupSeconds = 2, -- every n seconds
        maybeSpawnPowerupChance = 5, -- 1 in n
        powerupDuration = 5,
        powerups = { 'fuel-1' },
    },
    {
        alienType = 'alien-3',
        alienState = 'static',
        speedMultiplier = 1.8,
        alienCount = 10,
        duration = 10,
        --rocketCount = 20,
        terrainMinHeight = 8,
        terrainMaxHeight = 15,
        maybeSpawnRocketSeconds = 0.25,
        maybeSpawnRocketChance = 2,
        --maybeSpawnPowerupSeconds = math.random(5, 10), -- every n seconds
        maybeSpawnPowerupSeconds = 2, -- every n seconds
        maybeSpawnPowerupChance = 5, -- 1 in n
        powerupDuration = 5,
        powerups = { 'fuel-1' },
    },
    {
        alienType = 'alien-4',
        alienState = 'moving',
        speedMultiplier = 1.5,
        alienCount = 10,
        duration = 10,
        --rocketCount = 20,
        terrainMinHeight = 10,
        terrainMaxHeight = 18,
        maybeSpawnRocketSeconds = 0.25,
        maybeSpawnRocketChance = 2,
        --maybeSpawnPowerupSeconds = math.random(5, 10), -- every n seconds
        maybeSpawnPowerupSeconds = 2, -- every n seconds
        maybeSpawnPowerupChance = 5, -- 1 in n
        powerupDuration = 5,
        powerups = { 'fuel-1' },
    }
}
