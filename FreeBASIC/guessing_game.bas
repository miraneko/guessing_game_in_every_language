Randomize

Dim As Integer n, n_step
n = Rnd * 99 + 1
n_step = 1

Print "You should guess the number in range 1 .. 100"

Do
    Dim guess As Integer
    Input "Enter your guess: ", guess

    If guess < n Then
        Print "Your guess is too low :("
    ElseIf guess > n Then
        Print "Your guess is too high :("
    Else
        Exit Do
    EndIf

    n_step += 1
Loop

Print "You won in"; n_step; " steps!"
