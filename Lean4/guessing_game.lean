partial def game_loop (target : Nat) (step : Nat) := do
    IO.print "your guess: "
    let stdin ← IO.getStdin
    let line ← stdin.getLine
    match line.trim.toNat? with
    | none =>
        IO.println "you entered bullshit"
    | some guess =>
            match compare guess target with
            | .lt => do
                IO.println "your guess is too low"
                game_loop target step.succ
            | .gt => do
                IO.println "your guess is too high"
                game_loop target step.succ
            | .eq =>
                IO.println s!"you won in {toString step} steps!"

def main : IO Unit := do
    let target ← IO.rand 1 100
    IO.println "you should guess the number in range 1 .. 100"
    game_loop target 1
