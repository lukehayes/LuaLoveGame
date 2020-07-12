Object = require "core/classic"

local Paddle = Object:extend()

function Paddle:new(x,y)
    self.x = x
    self.y = y
    self.w = 60
    self.h = 10
end

function Paddle:update(dt)
    self.x = love.mouse.getX()

    if self.x < 0 or self.x > (700) then
        self.x = self.x
    end
end

function Paddle:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

return Paddle
