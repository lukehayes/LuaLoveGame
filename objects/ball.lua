Object = require "core/classic"

local Ball = Object:extend()

function Ball:new(x,y)
    self.x = x
    self.y = y
    self.w = 10
    self.h = 10
    self.speed = 200
    self.angle = 0.01
    self.color = {r = 0, g = 1,b = 1}
end

function Ball:update(dt)
    --Move the ball
    self.x = self.x + self.speed * math.cos(self.angle) * dt
    self.y = self.y + self.speed * math.sin(self.angle) * dt


    if self.x < 0 or self.x > (config.window.width - self.w) or self.y < 0 or self.y > (config.window.height - self.h) then
        self.speed = -self.speed
    end

    if love.mouse.isDown(1) then
        self:genAngle();
    end
end

function Ball:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1,1,1)
end

function Ball:genAngle()
    self.angle = love.math.random(0,359)
    self.angle = math.rad(self.angle)
end

function Ball:__tostring()
    return "Balls"
end

return Ball
