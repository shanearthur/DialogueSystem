-- required files
require 'source/constants'

function love.load()

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

    selectionMade = false

end


function love.update(dt)

    if timerCount > 0 then
        timerCount = timerCount - timerSpeed * dt
    else
        selectionMade = true
    end


end

function love.draw()

    setTextColor(WHITE)
    love.graphics.print("This is the first line of dialogue!", 0, 0)

    printSelected({"That's awesome.", "That's great.", "Whatever."})

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
    ----------------------------------------------------------TODOS: delete this "if selectionmade" and extend to a different state
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
            else
                setTextColor(NONE)
            end
        end
        love.graphics.print(texts[i+1], 0, i * 15 + 30)
    end
end
