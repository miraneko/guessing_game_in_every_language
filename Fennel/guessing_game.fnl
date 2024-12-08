(math.randomseed (os.time))

(print "You should guess the number in range 1 .. 100")

(fn game-loop [n ?step]
  (io.write "Please enter your guess: ")
  (let [guess (tonumber (io.read))
        step (or ?step 1)]
    (if guess (if (< guess n)
                  (do
                    (print "Your guess is too low :(")
                    (game-loop n (+ step 1)))
                  (> guess n)
                  (do
                    (print "Your guess is too high :(")
                    (game-loop n (+ step 1)))
                  (print (.. "You won in " step " steps!")))
        (do
          (print "You entered some bullshit")
          (game-loop n step)))))

(game-loop (math.random 1 100))

