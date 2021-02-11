local Paddle = require "objects/paddle"
local Ball = require "objects/ball"
local Bullet = require "objects/bullet"

local windowWidth = config.window.width
local p = Paddle(10, 580)
local b = Ball(40,40)

local balls = {}
local bullets = {}

function love.load(args)

    if not args[1] then args[1] = 0 end

    for i=1,args[1] do
        local rx = love.math.random(10,770)
        local ry = love.math.random(10,580)
        local rr = love.math.random(0,1)
        local rg = love.math.random(0,1)
        local rb = love.math.random(0,1)
        local ball = Ball(rx,ry)
        ball.color.r = rr
        ball.color.g = rg
        ball.color.b = rb

        table.insert(balls, ball)
        local bullet = Bullet(p.x + (p.w / 2),p.y)
        table.insert(bullets, bullet)
    end

    love.mouse.setVisible(false)
end

function love.update(dt)
    p:update(dt)
    b:update(dt)

    if love.mouse.isDown(1) then
        local bullet = Bullet(p.x + (p.w / 2) ,p.y + (p.h / 2))
        table.insert(bullets, bullet)
    end


    for _,bullet in pairs(bullets) do
        bullet:update(dt)
    end
end


function love.draw()
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)

    -- Draw all objects
    b:draw()

    for _,bullet in pairs(bullets) do
        bullet:draw()
    end

    p:draw()
end
