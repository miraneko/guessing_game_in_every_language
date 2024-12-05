fun main() {
    val n = (1..100).random()
    var step = 0

    println("You should guess the number in range 1 .. 100")

    do {
        print("Enter your guess: ")
        val guess = readlnOrNull()?.toIntOrNull()

        if (guess != null) {
            if (guess < n) {
                println("Your guess is too low :(")
            } else if (guess > n) {
                println("Your guess is too high :(")
            }
        } else {
            println("You entered bullshit")
        }

        step += 1
    } while (guess != n)

    println("You won in $step steps!")
}
