--Alan Subedi
shootSound = audio.loadSound( "shoot.wav" )

local shapes = {yPos = -50};
local size = 2

function shapes:new (o)    --constructor
    o = o or {}; 
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function shapes:spawn()
    self.shape=display.newCircle(math.random(10, display.contentWidth - 10), self.yPos,size * 30);
    self.shape:setFillColor (math.random(),math.random(),math.random());
    physics.addBody(self.shape, "dynamic"); 
end

function shapes:touch()
    self:delete()
    self:sound()
    return true
end

function shapes:delete(shape)
    self.shape:removeSelf()
    self.shape=nil;
end

function shapes:sound()
    print("im in shapes.lua/sound")
    audio.play( shootSound )
end


return shapes
