--Alan Subedi
local composer = require( "composer" )
local scene = composer.newScene()
 
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------

local group

-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view

end
 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
      group = display.newGroup()   
      local name = display.newText( "Alan Subedi", display.contentWidth/2, display.contentHeight/2 - 100, native.systemFont, 64 )
      name:setFillColor( 1, 1, 1 )
      group:insert(name)
       local function clickHandler(event)
           composer.gotoScene("scene2", {
               effect = "slideUp",
               time = 100,
           });
           return true
       end
   
      local nextScene = display.newRect( display.contentWidth/2, display.contentHeight/2, 180, 80 )
      nextScene.strokeWidth = 2
      nextScene:setFillColor( 1,1,1 )
      nextScene:setStrokeColor( 1, 1, 1 ) 
      nextScene:addEventListener('tap', clickHandler) 
      group:insert(nextScene)
   
      local nextPageLabel = display.newText( "Click Me!!", display.contentWidth/2, display.contentHeight/2, native.systemFontBold, 32 )
      nextPageLabel:setFillColor( 0, 0, 0 )
      nextPageLabel:addEventListener('tap', clickHandler)
      group:insert(nextPageLabel)
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
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
      display.remove(group)
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