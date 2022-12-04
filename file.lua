--Alan Subedi
--I wrote this file during our group work and am using this exact same one for this assignment as well..they fulfill the same purpose so
--teammates might use this file as well, not sure. But if there's any similarity in code that might be why.

local json = require( "json" )

--reads json file and returns a table
function read(file_name)
    --@params
    --file_name -> name of the json file to read from
    local defaultLocation = system.DocumentsDirectory
    local path = system.pathForFile( file_name, loc )
    local file, errorString = io.open( path, "r" )
    local contents = file:read( "*a" )
    local data = json.decode(contents)

    io.close(file)
    return data
end

--gets a table and writes that to a json file
function write(file_name, t)
    --@params
    --file_name -> name of the json file to read from
    --t -> table which will then be converted and written to json file
    local path = system.pathForFile( file_name, loc )
    local file, errorString = io.open(path, "w")
    file:write( json.encode( t ) )
    io.close(file)
end

--gets a table and prints it
function print_json(data)
    --@params
    --data --> table structure
    for k, v in pairs(data) do
        print(v["count"])
        -- for i, j in pairs(v) do
        --    print("i:", i)
        --    print("j:", j)
        -- end
     end
end

function get_count(object_type)
    local data = read("shape_number.json")
    local score
    for k, v in pairs(data) do
        if v["objectType"] == object_type then
            score = v["count"]
        end
    end
    return score
end

function set_count(object_type, score)
    local data = read("shape_number.json")
    for k, v in pairs(data) do
        if v["objectType"] == object_type then
            v["count"] = score
        end
    end
    write("shape_number.json", data)
end

return {
    read = read,
    write = write,
    print_json = print_json,
    get_count = get_count,
    set_count = set_count
}