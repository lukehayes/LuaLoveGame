local Paddle = require "objects/paddle"
local Ball = require "objects/ball"
local Bullet = require "objects/bullet"
local Sound = require "objects/sound"

local windowWidth = config.window.width
local p = Paddle(10, 580)
local b = Ball(40,40)
local s = Sound("assets/blip.mp3")
local rechargeRate = 2.5
local recharger = 0

local balls = {}
local bullets = {}

function genBall(tbl)
    local rx = love.math.random(10,770)
    local ry = love.math.random(10,580)
    local rr = love.math.random(0,7) / 10
    local rg = love.math.random(0,3) / 10
    local rb = love.math.random(0,9) / 10
    local ball = Ball(rx,ry)
    ball.color.r = rr
    ball.color.g = rg
    ball.color.b = rb

    table.insert(tbl, ball)
end

function love.load(args)

    if not args[1] then print("Not") args[1] = 0 end
    local c = 0

    for i=1,args[1] do

        genBall(balls)

        table.insert(balls, ball)
        local bullet = Bullet(p.x + (p.w / 2),p.y)
        table.insert(bullets, bullet)
        c = c + 1
    end

    print("Called: " .. c .. " times.")

    love.mouse.setVisible(false)
end

function love.update(dt)
    p:update(dt)
    b:update(dt)

    recharger = recharger + 0.1

    if love.mouse.isDown(1) and recharger > rechargeRate then
        local bullet = Bullet(p.x + (p.w / 2) ,p.y + (p.h / 2))
        table.insert(bullets, bullet)
        recharger = 0
        Sound:play()
    end

    for _,ball in pairs(balls) do
        ball:update(dt)
    end

    for _,bullet in pairs(bullets) do
        bullet:update(dt)
    end
end


function love.draw()

    love.graphics.clear(0.05,0.05,0.1,1)
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)

    -- Draw all objects

    for _,ball in pairs(balls) do
        ball:draw()
    end

    for _,bullet in pairs(bullets) do
        bullet:draw()
    end

    p:draw()
end
