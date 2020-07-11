Object = require "classic"

local rx = 10

local Point = Object:extend()
Point.type = "Point Type"

function Point:new(x,y)
    print("new called")
    self.x = x
    self.y = y
end

local p = Point(100,200)


function love.load()
    print(p.x)
    print(p.type)
end

function love.update(dt)
    print("FPS: "..love.timer.getFPS())

    for i = 1, 10000000 do
        rx = rx * rx
    end

end


--function love.draw()
--end
