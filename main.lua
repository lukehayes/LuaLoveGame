local mapObject = require "assets/maps/debug/map"
local mapImage = love.graphics.newImage("assets/maps/debug/tiles.png")
local tiles = {}
local mapWidth = mapObject.width
local mapHeight = mapObject.height
local tileX = mapObject.tilewidth
local tileY = mapObject.tileheight
local tileScale = 2


function love.load(args)
    loadTiles()
end

function love.update(dt)
end


function love.draw()

    local c = 0
    --for _,obj in pairs(mapObject.layers) do

        --if obj.data ~= nil then
            --for _,tile in pairs(obj.data) do
                --love.graphics.draw(mapImage, tiles[tile])

            --end
        --else
            --break
        --end
    --end
    --
    
    for k,v in pairs(mapObject.layers) do

        for i=1,mapWidth do
            print(i)
        end

    end


    --love.graphics.draw(mapImage,tiles[1], c,100)
end

function loadTiles()
    for i = 0,4 do
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
