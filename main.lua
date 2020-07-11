Object = require "classic"
require "setup"


function love.load()
    local objects = {}
    recursiveEnumerate("objects", objects)
    requireFiles(objects)
    
end

function love.update(dt)
end


function love.draw()
end
