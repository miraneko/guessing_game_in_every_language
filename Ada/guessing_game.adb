with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Guessing_Game is
   subtype Game_Range is Integer range 1 .. 100;

   package R is new Ada.Numerics.Discrete_Random (Game_Range);
   G : R.Generator;

   N    : Game_Range;
   Step : Positive := 1;
begin
   R.Reset (G);
   N := R.Random (G);

   Put_Line ("You should guess the number in range 1 .. 100");

   loop
      declare
         Guess : Game_Range;
      begin
         Put ("Enter your guess: ");
         Get (Guess);

         if Guess < N then
            Put_Line ("Your number is too small :(");
         elsif Guess > N then
            Put_Line ("Your number is too big :(");
         else
            exit;
         end if;

         Step := Step + 1;

      exception
         when Constraint_Error =>
            Put_Line ("Input is invalid, try again");

         when Data_Error =>
            Put_Line ("Input is invalid, exiting...");
            exit;
      end;
   end loop;

   Put_Line
     ("You won with on step" & Positive'Image (Step) & "!");
end Guessing_Game;
