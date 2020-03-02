-- Title: MovingObjects
-- Name: Ina Tolo
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade in. 
-- I added a second objectthat moves in a different direction, 
-- fades out and grows in size. 

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- global variables 
scrollSpeed = 3

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent 
beetleship.alpha = 0 

-- set the intial x and y position of beetleship 
beetleship.x = 0 
beetleship.y = display.contentHeight/3 

-- character image with width and height
local beetleship = display.newImageRect("Images/girl2.png", 200, 200)

-- flip the image horizontally
girl2:scale( -1, 1 )

-- set the initial x and y position of the girl 
girl2.x = 0 
girl2.y = display.contentHeight 


-- Function: MoveShip 
-- Input: this function accepts an event listener
-- Ouput: none 
-- Description: This funtion adds the scroll speed to the x-value of the ship 
local function MoveShip(event) 
	-- add the scroll speed to the x-value of the ship 
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out 
	beetleship.alpha = beetleship.alpha + 0.01 
end 

-- MoveShip will be called over and over again 
Runtime:addEventListener("enterFrame", MoveShip)

