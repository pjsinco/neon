Animation = Class({})

function Animation:init(params)
    self.frames = params.frames
    self.texture = params.texture
    self.interval = params.interval
    self.looping = params.looping

    self.timer = 0
    self.currentFrame = 1
    self.timesPlayed = 0

    -- function to invoke after each animation loop
    self.after = function() end
end

function Animation:refresh()
    self.timer = 0
    self.currentFrame = 1
    self.timesPlayed = 0
end

function Animation:update(dt)
    if not self.looping and self.timesPlayed > 0 then
        return
    end

    if #self.frames > 1 then
        self.timer = self.timer + dt
    
        if self.timer > self.interval then
            self.timer = self.timer % self.interval

            self.currentFrame = self.currentFrame == #self.frames and 1 or 
                                self.currentFrame + 1

            if self.currentFrame == 1 then
                self.timesPlayed = self.timesPlayed + 1
                self.after()
            end
        end
    end
end

function Animation:getCurrentFrame()
    return self.frames[self.currentFrame]
end
