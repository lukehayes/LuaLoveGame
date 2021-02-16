local mapObject = require "assets/maps/debug/map"
local mapImage = love.graphics.newImage("assets/maps/debug/tiles.png")
local tiles = {}
local tileX = 8
local tileY = 8
local tileScale = 2

function love.load(args)
    for i = 1,4 do
        local quad = love.graphics.newQuad(
                    i * tileX,
                    0,
                    tileX,
                    tileY,
                    mapImage:getDimensions()
         )

         table.insert(tiles, quad)
    end

    for k,v in pairs(tiles) do
        print(k, v)
    end
end

function love.update(dt)
end


function love.draw()
    local c = 100
    for k,v in pairs(tiles) do
        c = c + 10
        love.graphics.draw(mapImage,v, c,100)
    end
end
