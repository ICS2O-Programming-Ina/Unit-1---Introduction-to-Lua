-- Title: MathFun
-- Name: Ina 
-- Course: ICS2O
-- This program displays a math game with a 10 second countdown timer. The user is given four lives. 

--------------------------------------------------------------------------------
-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 93/255, 137/255, 128/255)

----------------------------------------------------------------------
-- LOCAL VARIABLES 
----------------------------------------------------------------------

-- create local variables 
local questionObject 
local correctObject 
local numericField 
local randomOperator = math.random(1,4)
local randomNumber1
local randomNumber2 
local userAnswer 
local correctAnswer
local correctAnswer1
local inCorrectObject 
local textSize = 50
local totalSeconds = 10
local secondsLeft = 10
local clockText 
local countDownTimer 

local lives = 4
local heart1
local heart2
local heart3
local heart4

----------------------------------------------------------------------
-- SOUNDS 
----------------------------------------------------------------------

local wrongSound = audio.loadSound( "Sounds/wrongSound.mp3" )
local wrondSoundChannel
local backgroundMusic = audio.loadStream( "Sounds/backgroundMusic.mp3" )
audio.play(backgroundMusic, { channel = 1, loops = -1})
audio.reserveChannels( 1 )

----------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1 and 4
	randomOperator = math.random(1,4)

	-- generate 2 random numbers
	randomNumber1 = math.random(0, 4)
	randomNumber2 = math.random(0, 4)
	audio.resume( 1 )
	-- if the random operator is 1, then do addition 
	if (randomOperator == 1) then 

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object 
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 3, do multiplication
	elseif (randomOperator == 3) then 
		-- calculate the correcr answer 
		correctAnswer = randomNumber1 * randomNumber2 

		-- create question in text object 
		questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 4, do division
	elseif (randomOperator == 4) then 
		-- calculate the correct answer 
		correctAnswer1 = randomNumber1 * randomNumber2 
		correctAnswer = correctAnswer1 / randomNumber1 
		questionObject.text = correctAnswer1 .. " / " .. randomNumber1 .. " = "
		
	-- otherwise, if the random operator is 2, do subtraction 
	elseif (randomOperator == 2) then 
		-- calculate the correct answer 
		correctAnswer = randomNumber1 - randomNumber2  
		roundedAnswer = print( math.round( correctAnswer ) )

		if (randomNumber1 < randomNumber2) then 
			correctAnswer = randomNumber2 - randomNumber1
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
		end
	end
end 

local function HideCorrect() 
	correctObject.isVisible = false
	AskQuestion()
end

local function HideInCorrect()
	inCorrectObject.isVisible = false 
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then 

		-- clear text field 
		event.target.text = ""

	elseif event.phase == "submitted" then 

		-- when the answer is submitted(enter key is pressed) set user input to user's answer 
		userAnswer = tonumber(event.target.text)
		audio.play(backgroundMusic, { channel = 1, loops = -1})

		-- if the users answer and correct answer are the same: 
		if (userAnswer == correctAnswer) then 
			event.target.text = ""
			correctObject.isVisible = true 
			timer.performWithDelay(2100, HideCorrect)
		else
			event.target.text = ""				
			inCorrectObject.isVisible = true
			timer.performWithDelay(2500, HideInCorrect)
			lives = lives - 1
			if (lives == 3) then 
				heart4.isVisible = false 
			elseif (lives == 2) then 
				heart3.isVisible = false 
			elseif (lives == 1) then 
				heart2.isVisible = false 
			elseif (lives == 0) then 
				heart1.isVisible = false
				gameOver.isVisible = true
				audio.stop( 1 )
				wrongSoundChannel = audio.play(wrongSound)
				questionObject.isVisible = false 
				clockText.isVisible = false 
				numericField.isVisible = false
				inCorrectObject.isVisible = false  
				countDownTimer = timer.cancel( countDownTimer )
			end
		end
	end
end

local function updateTime()

	-- decrement the number of seconds 
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object 
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then 
		-- reset the number of seconds left 
		secondsLeft = totalSeconds 
		lives = lives - 1

		if (lives == 3) then 
			heart4.isVisible = false 
		elseif (lives == 2) then 
			heart3.isVisible = false 
		elseif (lives == 1) then 
			heart2.isVisible = false 
		elseif (lives == 0) then 
			heart1.isVisible = false
			gameOver.isVisible = true
			audio.stop( 1 )
			wrongSoundChannel = audio.play(wrongSound)
			questionObject.isVisible = false 
			clockText.isVisible = false 
			numericField.isVisible = false
			inCorrectObject.isVisible = false  
			countDownTimer = timer.cancel( countDownTimer )
		end
		AskQuestion()
	end
end 

-- function that calls the timer 
local function StartTimer()
	-- create a countdown timer that loops infinetly 
	countDownTimer = timer.performWithDelay( 1000, updateTime, 0)
end

-------------------------------------------------------------------------------------
-- OBJECT CREATION 
-------------------------------------------------------------------------------------

-- displays a question and sets the colour 
questionObject = display.newText( "", 410, 370, nil, 70, Arial, textSize )
questionObject:setTextColor(250/255, 209/255, 243/255)

-- create the correct text object and make it visible 
correctObject = display.newText( "Correct!", 480, 460, nil, 50 )
correctObject:setTextColor(186/255, 188/255, 186/255)
correctObject.isVisible = false 

-- create the incorrect text obejct and make it visible 
inCorrectObject = display.newText( "Incorrect", 480, 460, nil, 50 )
inCorrectObject:setTextColor(209/255, 209/255, 209/255)
inCorrectObject.isVisible = false 

-- create numeric field 
numericField = native.newTextField( 590, 370, 150, 90 )
numericField.inputType = "decimal"

-- add the event listener fot the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener )

-- create the lives to display on the screen 
heart1 = display.newImageRect("Images/heart.png", 50, 50)
heart1.x = 980
heart1.y = 70

heart2 = display.newImageRect("Images/heart.png", 50, 50)
heart2.x = 880
heart2.y = 70

heart3 = display.newImageRect("Images/heart.png", 50, 50)
heart3.x = 780
heart3.y = 70

heart4 = display.newImageRect("Images/heart.png", 50, 50)
heart4.x = 680
heart4.y = 70

gameOver = display.newImageRect("Images/gameOver.png", 1000, 1000)
gameOver.x = 512
gameOver.y = 384
gameOver.isVisible = false

clockText = display.newText( secondsLeft, 55, 70, nil, 50, Arial, textSize)
clockText:setTextColor( 255/255, 255/255, 255/255)

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS 
------------------------------------------------------------------------------------------------

-- call the function to ask the question 
AskQuestion()

StartTimer()









