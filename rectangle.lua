--Alan Subedi
local circle = require ("circle");
shootSound = audio.loadSound( "shoot.wav" )
local rectangle = circle:new();
local size = 2

function rectangle:spawn()
    self.shape = display.newRect (math.random(30, 600), -50, size*30, size*30);
    self.shape:setFillColor (math.random(),math.random(),math.random());
    physics.addBody(self.shape, "dynamic");  
end

function rectangle:touch()
    self.shape.strokeWidth = 5
    self.shape:setStrokeColor(1,1,1)
    audio.play( shootSound )
end

return rectangle