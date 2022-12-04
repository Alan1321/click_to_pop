local shapes = require ("shapes");

local triangle = shapes:new();
local size = 2

function triangle:spawn()
    local vertices = {size*0,size*0,size*25,size*-50,size*50,size*0}
    self.shape = display.newPolygon (math.random(10, display.contentWidth - 10), self.yPos, vertices);
    self.shape:setFillColor (math.random(),math.random(),math.random());
    physics.addBody(self.shape, "dynamic");  
end

function triangle:touch(event)
    -- print(event.x, event.y)
    --print(self.shape.x, self.shape.y)
    if event.phase == "began" then
        print("began")
    elseif event.phase == "moved" then
        print("moved")
        self.shape.x = event.x
        self.shape.y = event.y
    elseif event.phase == "ended" then
        print("ended")
    end
    return true
end

return triangle