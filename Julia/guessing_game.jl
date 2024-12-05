n = rand(1:100)
step = 1

println("You should guess the number in range 1 .. 100")

while true
    print("Enter your guess: ")
    guess = parse(Int, readline())

    if guess < n
        println("Your guess is too low :(")
    elseif guess > n
        println("Your guess is too high :(")
    else
        break
    end

    global step += 1
end

println("You won in ", step, " steps!")
