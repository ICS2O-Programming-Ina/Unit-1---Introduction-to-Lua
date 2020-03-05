-- Title: TouchAndDrag
-- Name: Ina
-- Course: ICS2O
-- This program displays images  that react to a person's finger 

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local variables 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local beetleship = display.newImageRect("Images/beetleship.png", 150, 150) 
local beetleshipWidth = beetleship.width 
local beetleshipHeight = beetleship.height 

local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width 
local starHeight = star.height 

local bear = display.newImageRect("Images/bear.png", 200, 200)
local bearWidth = bear.width 
local bearHeight = bear.height

local jupiter = display.newImageRect("Images/jupiter.png", 200, 150)
local jupiterWidth = jupiter.width 
local jupiterHeight = jupiter.height

-- my boolean variables to keep track of which object I touched first 
local alreadyTouchedBeetleship = false 
local alreadyTouchedStar = false 
local alreadyTouchedBear = false
local alreadyTouchedJupiter = false

-- set the inital x and y positon of myImage 
beetleship.x = 400
beetleship.y = 500

star.x = 300 
star.y = 200 

bear.x = 800
bear.y = 400

jupiter.x = 100
jupiter.y = 100

-- Function: BeetleshipListener 
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
		beetleship.x = touch.x 
		beetleship.y = touch.y 
	end

	if (touch.phase == "ended") then 
		alreadyTouchedBeetleship = false 
		alreadyTouchedStar =  false
	end
end

-- add the respective listeners to each object 
 beetleship:addEventListener("touch", BeetleshipListener)

-- Function: StarListener 
-- Input: touch lisetenr 
-- Output: none
-- Description: when star is touhed move it 
local function StarListener(touch)

	if (touch.phase == "began") then 
		if (alreadyTouchedBeetleship == false) then 
			alreadyTouchedStar = true
		end 
	end 

	if ( ( touch.phase == "moved") and (alreadyTouchedStar == true) ) then 
		star.x = touch.x 
		star.y = touch. y
	end 

	if ( touch.phase == "ended") then 
		alreadyTouchedStar = false 
		alreadyTouchedBeetleship = false
	end
end

-- add the respective listeners to each object 
star: addEventListener("touch", StarListener)

-- Function: BearListener 
-- Input: touch listener 
-- Output: none
-- Description: when bear is touched, move it 
local function BearListener(touch)
	
	if (touch.phase == "began") then 
		if (alreadyTouchedJupiter == false) then 
			alreadyTouchedBear = true
		end
    end

	if ( (touch.phase == "moved") and (alreadyTouchedBear == true) ) then 
		bear.x = touch.x 
		bear.y = touch.y 
	end

	if (touch.phase == "ended") then 
		alreadyTouchedStar = false 
		alreadyTouchedBear =  false
	end
end

-- add the respective listeners to each object 
 bear:addEventListener("touch", BearListener)

-- Function: JupiterListener 
-- Input: touch listener 
-- Output: none
-- Description: when jupiter is touched, move it 
local function JupiterListener(touch)
	
	if (touch.phase == "began") then 
		if (alreadyTouchedBeetleship == false) then 
			alreadyTouchedJupiter = true
		end
    end

	if ( (touch.phase == "moved") and (alreadyTouchedJupiter == true) ) then 
		jupiter.x = touch.x 
		jupiter.y = touch.y 
	end

	if (touch.phase == "ended") then 
		alreadyTouchedJupiter = false 
		alreadyTouchedBear =  false
	end
end

-- add the respective listeners to each object 
 jupiter:addEventListener("touch", JupiterListener)

