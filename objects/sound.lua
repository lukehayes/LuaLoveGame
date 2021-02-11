Sound = Object:extend()

function Sound:new(soundFile)
    self.buffer = love.sound.newSoundData(soundFile)
    self.player = love.audio.newSource(self.buffer, "static")
    self.player:play()
end

function Sound:play()
    self.player:play()
end

--
--Shouldn't need these methods
function Sound:update(dt)
end
function Sound:draw()
end
--

return Sound

