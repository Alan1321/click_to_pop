local shapes = require ("shapes");

local rectangle = shapes:new();
local size = 2

function rectangle:spawn()
    self.shape = display.newRect (math.random(10, display.contentWidth - 10), self.yPos, size*30, size*30);
    self.shape:setFillColor (math.random(),math.random(),math.random());
    physics.addBody(self.shape, "dynamic");  
end

function rectangle:touch()
    self.shape.strokeWidth = 5
    self.shape:setStrokeColor(1,1,1)
end

return rectangle