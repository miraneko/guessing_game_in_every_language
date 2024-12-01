MODULE GuessingGame;

FROM STextIO IMPORT WriteLn, WriteString, SkipLine;
FROM SWholeIO IMPORT WriteCard, ReadCard;
FROM RandomNumber IMPORT Randomize, RandomCard;

TYPE GameRange = [1 .. 100];

VAR
   numberToGuess, guess : GameRange;
   step : CARDINAL;

BEGIN
   Randomize;
   numberToGuess := RandomCard (MIN (GameRange), MAX (GameRange));
   step := 1;

   WriteString ("You should guess the number in range 1 .. 100");
   WriteLn;

   LOOP
      WriteString ("Enter your guess (1 .. 100): ");
   
      ReadCard (guess);
      SkipLine;
      IF guess < numberToGuess THEN
         WriteString ("Your guess is too small :(");
         WriteLn
      ELSIF guess > numberToGuess THEN
         WriteString ("Your guess is too big :(");
         WriteLn
      ELSE
         EXIT
      END;
   
      step := step + 1
   END;

   WriteString ("You won in ");
   WriteCard (step, 0);
   WriteString (" steps!");
   WriteLn
END GuessingGame.
