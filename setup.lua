--function love.load()
    --local object_files = {}
    --recursiveEnumerate('objects', object_files)
    --requireFiles(object_files)
--end

--Enumerate through all of the files
function recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    for _, item in ipairs(items) do
        local file = folder .. '/' .. item
        if love.filesystem.getInfo(file) then
            table.insert(file_list, file)
        elseif love.filesystem.isDirectory(file) then
            recursiveEnumerate(file, file_list)
        end
    end
end

--Require all of the files
function requireFiles(files)
    for _, file in ipairs(files) do
        local file = file:sub(1, -5)
        print(file)
        require(file)
    end
end
