
-- This is just an example for assignment 3. It may include any error because I did not test it. 


local physics = require('physics');
physics.start();

local Shape = require("Shape")
local Circle = require("Circle")
local Rectangle = require("Rectangle")
local Triangle = require("Triangle")


local bottom = display.newRect(0, display.contentHeight-20, display.contentWidth, 20)
bottom.anchorX = 0; bottom.anchorY = 0
local left = display.newRect(0, 0, 20, display.contentHeight)
left.anchorX = 0; left.anchorY = 0
local right = display.newRect(display.contentWidth-20, 0, 20, display.contentHeight)
right.anchorX = 0; right.anchorY = 0


physics.addBody(bottom, 'static')
physics.addBody(left, 'static')
physics.addBody(right, 'static')


function fall()
	local xPos = 60 + math.random (360);
	local yPos = -20
    
    if (math.random() <= 0.333) then
        local c = Circle:new({x=xPos,y=yPos,color={math.random(), math.random(), math.random()}});
        c:spawn();
        c.shape:addEventListener("touch", c);
    elseif (math.random() > 0.333 and math.random() <= 0.666) then
        local r = rectangle:new({x=xPos,y=yPos,color={math.random(), math.random(), math.random()}});
        r:spawn();
        r.shape:addEventListener("touch", c);
      
     elseif (math.random() > 0.666) then
        local t = Triangle:new({x=xPos,y=yPos,color={math.random(), math.random(), math.random()}});
        t:spawn();
        t.shape:addEventListener("touch", r);
   	  
	end            
end

local dropShape = timer.performWithDelay(300, fall, 0)


