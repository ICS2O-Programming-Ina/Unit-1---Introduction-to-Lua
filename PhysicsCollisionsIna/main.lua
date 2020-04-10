-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Ina
-- Course: ICS2O
-- This program displays objects that fall and collide with the ground.
-----------------------------------------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------
--  Sound
-----------------------------------------------------------------------------------------

local backgroundMusic = audio.loadStream( "Sounds/backgroundMusic.mp3" )
audio.play(backgroundMusic, {loops = -1})

-----------------------------------------------------------------------------------------
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
local bkg = display.newImage("Images/bkg.png", 0, 0)

	-- set the x and y positions 
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- change the width and height to be the same as the screen 
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight
	-- send to back 
	bkg:toBack()


----------------------------------------------------------------------------------------

-- Second Beam 
local secondBeam = display.newImage("Images/beam.png", 0, 0)
	-- set the x and y position 
	secondBeam.x = 921.6
	secondBeam.y = display.contentCenterY*1.65

	-- change the width to be half of the screens 
	secondBeam.width = display.contentWidth/2 
	secondBeam.height = display.contentHeight*.10

	-- rotate the beam -60 degrees so it's on an angle 
	secondBeam:rotate(-45) 

	-- add to physics 
	physics.addBody(secondBeam, "static", {friction=0.5, bounce=0.3})

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
	ball2:scale(0.5,0.5)
end

----------------------------------------------------------------------------------------

local function thirdBall()
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)

	-- add the physics 
	physics.addBody(ball3, {density=1.0, friction=0.5, bounce=0.3, radius=25})
	ball3:scale(2,2)
end

----------------------------------------------------------------------------------------

local function fourthBall()
	local ball4 = display.newImage("Images/super_ball.png", 0, 0)
	ball4.x = 1024
	ball4.y = 0

	-- add the physics 
	physics.addBody(ball4, {density=1.0, friction=0.5, bounce=0.8, radius=25})
end

----------------------------------------------------------------------------------------

local function fifthBall()
	local ball5 = display.newImage("Images/super_ball.png", 0, 0)
	ball5.x = 1024
	ball5.y = 0
	ball5:scale(1.8,1.8)
	-- add the physics 
	physics.addBody(ball5, {density=1.0, friction=0, bounce=0.3, radius=25})
end

----------------------------------------------------------------------------------------

local function sixthBall()
	local ball6 = display.newImage("Images/super_ball.png", 0, 0)
	ball6.x = 1024
	ball6.y = 0
	ball6:scale(0.3,0.3)

	-- add the physics 
	physics.addBody(ball6, {density=3.0, friction=0.5, bounce=0.3, radius=25})
end
----------------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond 
----------------------------------------------------------------------------------------
timer.performWithDelay( 500, firstBall)
timer.performWithDelay( 0, secondBall)
timer.performWithDelay( 1000, thirdBall)
timer.performWithDelay( 500, fourthBall)
timer.performWithDelay( 1000, fifthBall)
timer.performWithDelay( 0, sixthBall)



