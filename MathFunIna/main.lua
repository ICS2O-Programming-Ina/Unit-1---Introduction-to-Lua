-- Title: MathFun
-- Name: Ina 
-- Course: ICS2O
-- This program 

--------------------------------------------------------------------------------
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
local incorrect = 0
----------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1 and 2 
	randomOperator = math.random(1,2)

	-- generate 2 random numbers
	randomNumber1 = math.random(0, 8)
	randomNumber2 = math.random(0, 8)

	-- if the random operator is 1, then do addition 
	if (randomOperator == 1) then 

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object 
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, if the random operatio is 2, do subtraction 
	elseif (randomOperator == 2) then 
		-- calculate the correct answer 
		correctAnswer = randomNumber1 - randomNumber2 

		-- create question in text object 
	end
end 

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS 
------------------------------------------------------------------------------------------------

-- call the function to ask the question 
AskQuestion()