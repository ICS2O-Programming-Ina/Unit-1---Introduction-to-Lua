-- Title: TouchAndDrag
-- Name: Ina
-- Course: ICS2O
-- This program displays images  that react to a person's finger 

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local variables 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local beetleship = display.newImageRect("Images/beetleship.png"), 150, 150 
local beetleshipWidth = beetleship.width 
local beetleshipHeight = beetleship.height 

local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width 
local starHeight = star.height 

-- my boolean variables to keep track of which object I touched first 
local alreadyTouchedBeetleship = false 
local alreadyTouchedStar = false 

-- set the inital x and y positon of myImage 
beetleship.x = 400
beetleship.y = 500

star.x = 300 
star.y = 200 

-- Function: BeetleShipListener 
-- Input: touch listener 
-- Output: none
-- Description: when beetleship is touched, move it 
local function BeetleshipListener(touch)
	
	if (touch.phase == "began") then 
		if (alreadyTouchedStar == false) then 
			alreadyTouchedBeetleship = true
		end
    end

	if ( (touch.phase == "moved") and (alreadyTouchedBeetleship == true) ) then 
		beetleship = touch.x 
		beetleship = touch.y 
	end

	if (touch.phase == "ended") then 
		alreadyTouchedBeetleship = false 
		alreadyTouchedStar =  false
	end
end

-- add the respective listeners to each object 
 beetleship:addEventListener("touch", BeetleshipListener)