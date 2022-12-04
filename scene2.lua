--Alan Subedi
local composer = require( "composer" )
local scene = composer.newScene()
local physics = require("physics")
local circle = require("circle")
local rectangle = require("rectangle")
local triangle = require("triangle")
local Enemy = require("shapes")
local file = require("file")
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------

local group = display.newGroup()

-- "scene:create()"
function scene:create( event )
 
    local sceneGroup = self.view
    physics.start()
    file.set_count("circle",0)
    file.set_count("rectangle",0)
    file.set_count("triangle",0)

    local name = display.newText( "Scene 2", display.contentWidth/2, display.contentHeight/2 - 500, native.systemFont, 32 )
    name:setFillColor( 1, 1, 1 )
    sceneGroup:insert(name)

    local leftWall = display.newRect( 5, display.contentHeight / 2, 10, display.contentHeight )
    leftWall.strokeWidth = 2
    leftWall:setFillColor( 1,1,1 )
    leftWall:setStrokeColor( 1, 1, 1 ) 
    physics.addBody( leftWall, "static")
    sceneGroup:insert(leftWall)

    local rightWall = display.newRect( display.contentWidth - 5, display.contentHeight / 2, 10, display.contentHeight )
    rightWall.strokeWidth = 2
    rightWall:setFillColor( 1,1,1 )
    rightWall:setStrokeColor( 1, 1, 1 ) 
    physics.addBody( rightWall, "static")
    sceneGroup:insert(rightWall)

    local bottomWall = display.newRect( display.contentWidth / 2, display.contentHeight - 5, display.contentWidth, 10 )
    bottomWall.strokeWidth = 2
    bottomWall:setFillColor( 1,1,1 )
    bottomWall:setStrokeColor( 1, 1, 1 ) 
    physics.addBody( bottomWall, "static")
    sceneGroup:insert(bottomWall)

    
    function fall()
        local xPos = 60 + math.random (360);
        local yPos = -20
        
        if (math.random() <= 0.333) then
            local count = file.get_count("circle")
            file.set_count("circle",count+1)
            local c = circle:new();
            c:spawn();
            c.shape:addEventListener("touch", c);
        elseif (math.random() > 0.333 and math.random() <= 0.666) then
            local count = file.get_count("rectangle")
            file.set_count("rectangle",count+1)
            local r = rectangle:new();
            r:spawn();
            r.shape:addEventListener("touch", r);
        elseif (math.random() > 0.666) then
            local count = file.get_count("triangle")
            file.set_count("triangle",count+1)
            local t = triangle:new();
            t:spawn();
            t.shape:addEventListener("touch", t);
        end  
    end

end
 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
      local dropShape = timer.performWithDelay(300, fall, 0)
   end
end
 
-- "scene:hide()"
function scene:hide( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end
 
-- "scene:destroy()"
function scene:destroy( event )
 
   local sceneGroup = self.view
 
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end
 
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
---------------------------------------------------------------------------------
 
return scene