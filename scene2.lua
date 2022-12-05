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

local group
local circle_count
local rectangle_count
local triangle_count

-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view

   function addScene()   
      group = display.newGroup()
      physics.start()
      file.set_count("circle",0)
      file.set_count("rectangle",0)
      file.set_count("triangle",0)
   
      local leftWall = display.newRect( 5, display.contentHeight / 2, 10, display.contentHeight )
      leftWall.strokeWidth = 2
      leftWall:setFillColor( 1,1,1 )
      leftWall:setStrokeColor( 1, 1, 1 ) 
      group:insert(leftWall)
      physics.addBody( leftWall, "static")
   
      local rightWall = display.newRect( display.contentWidth - 5, display.contentHeight / 2, 10, display.contentHeight )
      rightWall.strokeWidth = 2
      rightWall:setFillColor( 1,1,1 )
      rightWall:setStrokeColor( 1, 1, 1 ) 
      group:insert(rightWall)
      physics.addBody( rightWall, "static")
   
      local bottomWall = display.newRect( display.contentWidth / 2, display.contentHeight - 5, display.contentWidth, 10 )
      bottomWall.strokeWidth = 2
      bottomWall:setFillColor( 1,1,1 )
      bottomWall:setStrokeColor( 1, 1, 1 ) 
      group:insert(bottomWall)
      physics.addBody( bottomWall, "static")
   
      function backHandler()
        composer.gotoScene("scene1", {
           effect = "slideDown",
           time = 100,
        });
      end
      
      local backButton = display.newRect(display.contentWidth - 100, 100, 150,80)
      backButton:setFillColor(1,1,1)
      backButton:addEventListener("tap", backHandler)
      group:insert(backButton)
      
      local backText = display.newText( "Go Back", display.contentWidth - 100, 100, native.systemFontBold, 32 )
      backText:setFillColor( 0, 0, 0 )
      group:insert(backText) 
   end

   function fall()
       local xPos = 60 + math.random (360);
       local yPos = -20
       
       if (math.random() <= 0.333) then
         --   local count = file.get_count("circle")
         --   file.set_count("circle",count+1)
            circle_count = circle_count + 1
           local c = circle:new();
           c:spawn();
           c.shape:addEventListener("touch", c);
           group:insert(c:returnShape())
       elseif (math.random() > 0.333 and math.random() <= 0.666) then
         --   local count = file.get_count("rectangle")
         --   file.set_count("rectangle",count+1)
            rectangle_count = rectangle_count + 1
           local r = rectangle:new();
           r:spawn();
           r.shape:addEventListener("touch", r);
           group:insert(r:returnShape())
       elseif (math.random() > 0.666) then
         --   local count = file.get_count("triangle")
         --   file.set_count("triangle",count+1)
            triangle_count = triangle_count + 1
           local t = triangle:new();
           t:spawn();
           t.shape:addEventListener("touch", t);
           group:insert(t:returnShape())
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
      circle_count = 0
      rectangle_count = 0
      triangle_count = 0
      droptimer = timer.performWithDelay(300, fall, 0)
      addScene()
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
      file.set_count("circle", circle_count)
      file.set_count("rectangle", rectangle_count)
      file.set_count("triangle", triangle_count)
      display.remove(group)
      timer.pause(droptimer)
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