Object = require "core/classic"

local Bullet = Object:extend()

function Bullet:new(x,y)
    self.x = x
    self.y = y
    self.w = 5
    self.h = 5
    self.speed = 200
    self.angle = 0.01
    self.damage = 1
    self.color = {r = 1, g = 0.6,b = 0.4}
end

function Bullet:update(dt)
end

function Bullet:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1,1,1)
end

function Bullet:__tostring()
    return "Bullet"
end

return Bullet
