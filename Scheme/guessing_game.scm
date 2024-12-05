;; CHICKEN Scheme

; requires srfi-27
(import srfi-27)

(random-source-randomize! default-random-source)

(set! n (+ 1 (random-integer 100)))
(set! step 1)

(display "You should guess the number in range 1 .. 100")
(newline)

(define (get-user-input)
    (display "Enter your guess: ")
    (read))

(do ([guess (get-user-input) (get-user-input)])
    ((= guess n))
    (cond [(< guess n) (display "Your guess is too low :(") (newline)]
          [(> guess n) (display "Your guess is too high :(") (newline)])
    (set! step (+ step 1)))

(display "You won in ")
(display step)
(display " steps!")
(newline)
