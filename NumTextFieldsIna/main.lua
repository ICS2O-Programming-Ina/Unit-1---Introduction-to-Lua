-- Title: NumericTextFields
-- Name: Ina 
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textField
-- terminal 
-----------------------------------------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 190/255, 255/255, 250/255)

----------------------------------------------------------------------
-- LOCAL VARIABLES 
----------------------------------------------------------------------

-- create local variables 
local questionObject 
local correctObject 
local numericField 
local randomNumber1
local randomNumber2 
local userAnswer 
local correctAnswer
local inCorrectObject 
local textSize = 50
local points = 0
local incorrect = 0
local gameOverText = "Game Over"
local youWinText = "You Win"
local actualAnswerText 
----------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number 
	randomNumber1 = math.random(0, 8)
	randomNumber2 = math.random(0, 8)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object 
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

end 

local function HideCorrect() 
	correctObject.isVisible = false
	AskQuestion()
end

local function HideInCorrect()
	inCorrectObject.isVisible = false 
	AskQuestion()
end

local function HideActualAnswerText()
	actualAnswerText.isVisible = false
end


local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then 

		-- clear text field 
		event.target.text = ""

	elseif event.phase == "submitted" then 

		-- when the answer is submitted(enter key is pressed) set user input to user's answer 
		userAnswer = tonumber(event.target.text)

		-- if the users answer and correct answer are the same: 
		if (userAnswer == correctAnswer) then 
			event.target.text = ""
			correctObject.isVisible = true 
			timer.performWithDelay(2100, HideCorrect)
			-- give a point if the user gets the correct answer 
			points = points + 1 
			-- update it in the display object
			pointsText.text = "Points = " .. points
		
			if (points == 6) then 
				correctObject.isVisible = false
				pointsText.isVisible = false
				questionObject.isVisible = false
				numericField.isVisible = false 
				incorrectText.isVisible = false 
				youWinText = display.newText(youWinText, 512, 384, nil, 75)
				youWinText:setTextColor(176/255, 179/255, 191/255)	
			end

		else 
			event.target.text = ""					
			inCorrectObject.isVisible = true
			timer.performWithDelay(2500, HideInCorrect)
			incorrect = incorrect + 1
			incorrectText.text = "Incorrect = " .. incorrect
			actualAnswerText,isVisible = true
			timer.performWithDelay(2500, HideActualAnswerText)
			actualAnswerText = display.newText("The correct answer is " .. correctAnswer, 280, 205, nil, 30)
			actualAnswerText:setTextColor(176/255, 179/255, 191/255 )					
				
			if (incorrect == 3) then 
				inCorrectObject.isVisible = false
				numericField.isVisible = false
				questionObject.isVisible = false
				incorrectText.isVisible = false 
				pointsText.isVisible = false
				actualAnswerText.isVisible = false
				gameOverText = display.newText(gameOverText, 512, 384, nil, 75)
				gameOverText:setTextColor(176/255, 179/255, 191/255)	
			end
		end
	end
end

	
-------------------------------------------------------------------------------------
-- OBJECT CREATION 
-------------------------------------------------------------------------------------

-- displays a question and sets the colour 
questionObject = display.newText( "", 210, 70, nil, 50, Arial, textSize )
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it visible 
correctObject = display.newText( "Correct!", 230, 150, nil, 50 )
correctObject:setTextColor(186/255, 188/255, 186/255)
correctObject.isVisible = false 

-- create the incorrect text obejct and make it visible 
inCorrectObject = display.newText( "Incorrect", 230, 150, nil, 50 )
inCorrectObject:setTextColor(209/255, 209/255, 209/255)
inCorrectObject.isVisible = false 

-- create numeric field 
numericField = native.newTextField( 370, 70, 150, 70 )
numericField.inputType = "number"

-- add the event listener fot the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener )

-- display the amount of points as a text object 
pointsText = display.newText("Points = " .. points, 850, 70, nil, 50)
pointsText:setTextColor(124/255, 133/255, 255/255)

incorrectText = display.newText("Incorrect = " .. incorrect, 90, 745, nil, 25)
incorrectText:setTextColor(124/255, 133/255, 255/255)

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS 
------------------------------------------------------------------------------------------------

-- call the function to ask the question 
AskQuestion()




