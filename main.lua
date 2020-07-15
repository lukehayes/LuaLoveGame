local TMX = require "tilemaps/8BitDungeon"
local base = require "base"


local tileQuads = {}
local img = love.graphics.newImage("tilemaps/8BitDungeon.png")
print(img)


local windowWidth = config.window.width

function love.load(args)
    for i = 0,40,8 do
        local quad = love.graphics.newQuad(i,0,8,8, img:getDimensions())
        table.insert(tileQuads, quad);
    end
end

function love.update(dt)
end


function love.draw()
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    love.graphics.draw(img)
    for k,v in pairs(tileQuads) do
    end
end
