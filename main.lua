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
    print(tiles[1])
end

function love.update(dt)
end


function love.draw()

    local y = 0

    for k,layer in pairs(mapObject.layers) do

        if layer.name == "Collisions" then break end

        print("Loading " .. layer.name)
        print("Length: " .. #layer.data)

        for x=1, #layer.data do
            --love.graphics.draw(mapImage,tiles[x], x * tileX, y * tileY)

            print(x, y)
            
           if x == 20 then y = y + 20 end
        end


        for i=0,4 do
            love.graphics.draw(mapImage,tiles[i], i * 2, i * 2)
        end

    end
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
end
