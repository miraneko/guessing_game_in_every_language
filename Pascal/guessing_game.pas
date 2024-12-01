
Program GuessingGame;

Type GameRange = 1 .. 100;

Var 
  n : GameRange;
  guess : GameRange;
  nStep : Integer;
Begin
  Randomize;

  n := Random(100) + 1;
  nStep := 0;

  WriteLn('You should guess the number in range 1 .. 100');

  Repeat
    Write('Please enter your guess: ');
    ReadLn(guess);

    If guess < n Then
      WriteLn('Your guess is too low :(')
    Else If guess > n Then
           WriteLn('Your guess is too high :(');

    nStep := nStep + 1
  Until (guess = n);

  WriteLn('You won in ', nStep, ' steps!')
End.
