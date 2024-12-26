#lang racket

(define n (random 1 101))

(displayln "You should guess the number in range 1 .. 100")

(let loop ([step 1])
  (display "Enter your guess: ")
  (let ([guess (string->number (read-line))])
    (cond
      [(not guess)
       (begin
         (displayln "You entered bullshit")
         (loop step))]
      [(< guess n)
       (begin
         (displayln "Your guess is too low")
         (loop (+ step 1)))]
      [(> guess n)
       (begin
         (displayln "Your guess is too high")
         (loop (+ step 1)))]
      [else (displayln (string-append "You won in "
                                      (number->string step)
                                      " steps"))])))
