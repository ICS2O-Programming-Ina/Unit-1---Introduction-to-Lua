-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Ina
-- Course: ICS2O
-- This program displays objects that fall and collide with the ground.
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
local backgroundMusic =  audio.loadStream( "Sound/backgroundMusic.mp3" )
audio.play(backgroundMusic, {loops = -1})

-- load physics 
local physics = require("physics")

-- start physics 
physics.start()
-----------------------------------------------------------------------------------------
-- OBJECTS
-----------------------------------------------------------------------------------------
-- Ground 
local ground = display.newImage("Images/ground.png", 0, 0)
	-- set the x and y position 
	ground.x = 512
	ground.y = 768
	-- chnage the width to be the same as the screen 
	ground.width = display.contentWidth 

	-- add to physics 
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3}) 

----------------------------------------------------------------------------------------
-- Beam 
local beam = display.newImage("Images/beam.png", 0, 0)
	-- set the x and y position 
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65
	-- change the width to be half of the screens 
	beam.width = display.contentWidth/2 
	beam.height = display.contentHeight*.10

	-- rotate the beam -60 degrees so it's on an angle 
	beam:rotate(45) 

	-- send it to the back layer 
	beam:toBack() 

	-- add to physics 
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

----------------------------------------------------------------------------------------
-- Background
local bkg = display.newImage("Images/bkg,png", 0, 0)

	-- set the x and y positions 
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- change the width and height to be the same as the screen 
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight
	-- send to back 
	bkg:toBack()

----------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------

-- create the first ball 
local function firstBall()
	-- creating first ball 
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

----------------------------------------------------------------------------------------

local function secondBall()
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics 
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=25})
	scale:ball2(0.5,0.5)
end

----------------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond 
----------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
