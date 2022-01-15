-- required files
require 'source/constants'

function love.load()

    -- setup window (small window for now)
    love.window.setMode(300, 200)
    love.window.setTitle(" ")

    -- sets font
    font = love.graphics.newFont('fonts/MochiyPopPOne-Regular.ttf')
    love.graphics.setFont(font)

    -- counter for dialogue selection
    selectionCounter = 0

    -- timer length
    timerCount = 94
    timerLength = timerCount + 6
    timerSpeed = 15

    -- selection toggle
    selectionMade = false

end


function love.update(dt)

    -- mechanic of timer reducing
    if timerCount > 0 then
        timerCount = timerCount - timerSpeed * dt
    else
        selectionMade = true
    end


end

function love.draw()
    -- initial text
    setTextColor(WHITE)
    love.graphics.print("This is the first line of dialogue!", 0, 0)
    -- function for printing selectable responses
    printSelected({"That's awesome.", "That's great.", "Whatever."})
    -- timer bar
    love.graphics.setColor(YELLOW)
    love.graphics.rectangle('line', 0, 100, timerLength, 11, 2)
    love.graphics.rectangle('fill', 3, 103, timerCount, 5)
end

-- makes text color selection easier
function setTextColor(color)
    love.graphics.setColor(color)    
end

-- spacebar functionality
function love.keypressed(key)
    if selectionMade == false then
        if key == 'space' then
            if selectionCounter < 2 then
                selectionCounter = selectionCounter + 1
            else
                selectionCounter = 0
            end
        end
    end
end

function printSelected(texts)
    for i = 0, 2, 1 do
        if i == selectionCounter then
            setTextColor(YELLOW)
        else
            if selectionMade == false then
                setTextColor(FADED)
                if timerCount < 10 then
                    -- sets to faded but losing alpha as timer runs out
                    love.graphics.setColor(1, 1, 1, timerCount/20)
                end
            else
                setTextColor(NONE)
            end
        end
        love.graphics.print(texts[i+1], 0, i * 15 + 30)
    end
end
