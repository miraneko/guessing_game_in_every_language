from random import randint

n = randint(1, 100)
step = 1

print("You shoud guess the number in range 1 .. 100")

while True:
    guess = int(input("Enter your guess: "))
    if guess < n:
        print("Your guess is too low :(")
    elif guess > n:
        print("Your guess is too high :(")
    else:
        break
    step += 1

print(f"You won in {step} steps!")
