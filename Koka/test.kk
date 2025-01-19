import std/os/readline
import std/num/random

fun repeat-until(action: () -> <div|e> bool) : <div|e> ()
  if action() then ()
  else repeat-until(action)

fun main()
  val n = random-int() % 100 + 1
  var step := 1
  println("You should guess the number in range 1 .. 100")
  repeat-until
    print("Enter your guess: ")
    match readline().parse-int()
      Just(guess) | guess < n ->
        println("Your guess is too low")
        step := step + 1
        False
      Just(guess) | guess > n ->
        println("Your guess is too high")
        step := step + 1
        False
      Just(_) -> True
      Nothing ->
        println("Invalid input")
        False
  println("You won in " ++ step.show ++ " steps")
