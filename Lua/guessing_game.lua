math.randomseed(os.time())

local n = math.random(1, 100)
local step = 1

print("You should guess the number in range 1 .. 100")

while true do
    io.write("Please enter your guess: ")
    local guess = tonumber(io.read())

    if guess then
        if guess < n then
            print("Your guess is too low :(")
        elseif guess > n then
            print("Your guess is too high :(")
        else
            break
        end

        step = step + 1
    else
        print("You entered some bullshit")
    end
end

print("You won in " .. step .. " steps!")
