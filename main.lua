local Paddle = require "objects/paddle"
local Ball = require "objects/ball"

local windowWidth = config.window.width
local p = Paddle(10, 580)
local b = Ball(40,40)

local bigBallsBob = {}

function love.load(args)

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

        table.insert(bigBallsBob, ball)
    end

    love.mouse.setVisible(false)
end

function love.update(dt)
    p:update(dt)
    b:update(dt)

    for _,ball in pairs(bigBallsBob) do
        ball:update(dt)
    end
end


function love.draw()
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    p:draw()
    b:draw()
    for _,ball in pairs(bigBallsBob) do
        ball:draw()
    end
end
