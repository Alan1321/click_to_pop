--Alan Subedi
local shapes = require ("shapes");
shootSound = audio.loadSound( "shoot.wav" )
local triangle = shapes:new();
local size = 2

function triangle:spawn()
    local vertices = {size*0,size*0,size*25,size*-50,size*50,size*0}
    self.shape = display.newPolygon (math.random(30, 600), -50, vertices);
    self.shape:setFillColor (math.random(),math.random(),math.random());
    physics.addBody(self.shape, "dynamic");  
end

function triangle:touch(event)
    if event.phase == "began" then
    elseif event.phase == "moved" then
        self.shape.x = event.x
        self.shape.y = event.y
    elseif event.phase == "ended" then
    end
    return true
end

return triangle