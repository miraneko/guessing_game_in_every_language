n = int (rand * 99 + 1)
nStep = 1

print "You should guess the number in range 1 .. 100!"

do
	input "Enter your guess: ", guess 

	begin case
		case guess < n
			print "Your guess is too low :("
		case guess > n
			print "Your guess is too high :("
	end case
	nStep += 1
until guess = n

print "You won in ";
print nStep;
print " steps!"
