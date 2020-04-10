-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Ina 
-- Course: ICS2O
-- This program places a random object on the screen. If the user clicks on it in time, 
-- the score increases by 1. 
-----------------------------------------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- Sets the background colour
display.setDefault("background", 195/255, 213/255, 249/255)

-----------------------------------------------------------------------------------------
-- SOUNDS 
-----------------------------------------------------------------------------------------

local backgroundMusic = audio.loadStream( "Sounds/backgroundMusic.mp3" )
audio.play(backgroundMusic, {loops = -1})
local drumrollSound = audio.loadSound( "Sounds/drumrollSound.mp3" )
local drumrollSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES 
-----------------------------------------------------------------------------------------

-- Creating dog 
local dog = display.newImage( "Images/dog.png", 0, 0 )

-- Setting position
dog.x = display.contentCenterX
dog.y = display.contentCenterY

-- Scaling the image down to a third of the original 
dog:scale(.8, .8)

-- Making the dog invisible 
dog.isVisible = false

local score = 0
local scoreText
local textsize = 35

-----------------------------------------------------------------------------------------
-- FUNCTIONS 
-----------------------------------------------------------------------------------------

-- This function that makes the dog appear in a random (x,y) position on the screen 
-- before calling the Hide function.
function PopUp()

	-- choosing random position on the screen between 0 and the size of the screen 
	dog.x = math.random( 0, display.contentWidth)
	dog.y = math.random( 0, display.contentHeight)
	-- making the mole visible 
	dog.isVisible = true
	-- calling the hide function after 500 miliseconds 
	timer.performWithDelay( 800, Hide )
end

-- this function calls the PopUp function after 3 seconds 
function PopUpDelay( )
	timer.performWithDelay( 3000, PopUp )
end

-- This function makes the dog invisible and then calls the PopUpDelay function.
function Hide( )

	-- changing visibility 
	dog.isVisible = false 
	PopUpDelay()
end

-- this function starts the game 
function GameStart( )
	PopUpDelay()
end

-- this function increments the score only if the dog is clicked. It them displays the 
-- new score.
function Whacked( event )

	-- If touch phase just started 
	if (event.phase == "began") then 
		-- score is incresed by 1
		score = score + 1
		-- displays the score in the text object 
		scoreText.text = "Score = " .. score
		drumrOllSoundChannel = audio.play( drumrollSound )
	end


end

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS 
-----------------------------------------------------------------------------------------
-- I added the event listenr to the dog so that if the dog is touched, the Whacked function 
-- is called. 
dog:addEventListener( "touch", Whacked )


-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

scoreText = display.newText( "", 120, 70, nil, 35, Arial, textsize )
scoreText:setTextColor(91/255, 91/255, 91/255)
scoreText.isVisible = true


-----------------------------------------------------------------------------------------
-- START THE GAME
-----------------------------------------------------------------------------------------

-- calls the funtion that starts the game
GameStart()

