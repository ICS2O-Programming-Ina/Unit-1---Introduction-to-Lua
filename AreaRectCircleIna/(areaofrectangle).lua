-- Title: Local Variables
-- Name: Ina
-- Course: ICS2O
-- This program displays a rectangle and shows its area

-- create my local variables
local areaText
local textSize = 50
local myRectangle 
local widthOfRectabgle = 350
local heightOfRectangle = 200
local areaOfRectangle

-- set the background colour of my screen.Remeber that colors are between 0 and 1. 
display.setDefault("beackground", 154/255, 204/255, 255,255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size. 
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle:strokeWidth = 20 

-- set the colour of the rectangle 
myRectangle:setStrokeFillColor(0.7, 0.1, 0.3)

-- set the color of the border
myRectangle:setStrokeColor(0, 1, 0)

-- calculate the area 
areaOfRectangle = witdthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x.y) position 
areaText.anchorX = 0 
areaText.anchorY = 0 
myRectangle.x = 20 
myRectangle.y = diplay.contentHeight/2

-- set the colour of the newText 
areaText:setTextColour(1, 1, 1)

