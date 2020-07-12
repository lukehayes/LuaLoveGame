Object = require "core/classic"

local Paddle = Object:extend()

function Paddle:new(x,y)
    self.x = x
    self.y = y
    self.w = 60
    self.h = 10
end

return Paddle
