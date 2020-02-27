-- Title: Local Variables
-- Name: Ina
-- Course: ICS2O
-- This program displays four different shapes and calculates their areas

-- set the background colour of my screen.Remeber that colors are between 0 and 1. 
display.setDefault("background", 191/255, 141/255, 141,255)

-- to remove status background
display.setStatusBar(display.HiddenStatusBar) 

local verticesTrapezoid = { -70, 70, 70, 70, 160, -70, -160, -70 }
local trapezoid = display.newPolygon(display.contentWidth/4, display.contentHeight/4, verticesTrapezoid)
local myTrapezoid

-- set the width of the border 
trapezoid.storkeWidth = 20

-- set the colour of the trapezoid 
trapezoid:setFillColor(.8, .7, .8)

-- set the color of the border
trapezoid:setStrokeColor(1, 1, 1)


