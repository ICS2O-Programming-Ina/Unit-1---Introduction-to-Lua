-- Title: TouchAndReact
-- Name: Ina
-- Course: ICS2O
-- This program does something when I click on the button. 

-- set the background colour 
display.setDefault ("background", 229/255, 123/255, 123/255)

-- hide status bar 
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible 
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2 
blueButton.y = display.contentHeight/2 
blueButton.isVisible = true

-- create red button, set its position and make it invisble
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/ 2
redButton.y = display.contentHeight/2 
redButton.isVisible = false

-- create text objects, set its positon and make it invisible 
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = 512
textObject.y = 300
textObject.isVisible = false 

---------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------

-- create local variables 
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel

-- Function: BlueButtonListener 
-- Input: touch Listener 
-- Output: none 
-- Description: when blue button is clicked, it wil make the text appear with the red button,
-- and make the blue disappear 
local function BlueButtonListener(touch)
	if (touch.phase == "began") then 
		blueButton.isVisible = false 
		redButton.isVisible = true
		correctSoundChannel = audio.play(correctSound)
		textObject.isVisible = true 
	end
end 

-- add the respective listeners to each object 
blueButton:addEventListener("touch", BlueButtonListener)

-- Function: RedButtonListener 
-- Input: touch listener 
-- Output: none 
-- Description: when red button is clicked, it will make the blue button appear again
local function RedButtonListener(touch)
	if (touch.phase == "ended") then 
		redButton.isVisible = false 
		blueButton.isVisible = true 
		textObject.isVisible = false 
	end
end 

-- add the respective listeners to each object 
redButton: addEventListener("touch", RedButtonListener)



