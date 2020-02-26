-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("**** Helloooooooooooooo!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the color of the background 
display.setDefault ("background", 255/255, 102/255, 102/255)

-- create a local variable
local textObject

-- displays text on the screen at position x = 500 and y = 500 with
-- a default font style and font size of 50 
textObject = display.newText( "Hello, Ina!", 500, 500, nil, 100)

-- sets the color of the text 
textObject:setTextColor(178/255, 66/255, 255/255)

-- create a local variable
local signiture
-- displays text on the screen at position x = 500 and y = 500 with
-- a default font style and font size of 50 
signiture = display.newText( "By: Ina Tolo", 500, 600, nil, 50)
